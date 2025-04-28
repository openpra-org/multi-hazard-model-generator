import copy
from src.mainshock_aftershocks.tree_builder import TreeBuilder
from src.mainshock_aftershocks.flag_sets import FlagSetWriter
from pymongo import MongoClient
from src.imports import *
import unittest


class TsunamiFaultTree:
    def __init__(self, mongodb_uri, general_input_db_name, seismic_flooding_db_name):
        """
        Initialize the TsunamiFaultTree class.

        Parameters:
        - mongodb_uri: MongoDB URI
        - general_input_db_name: Name of the database containing general input data
        - seismic_flooding_db_name: Name of the database containing seismic and flooding data
        """
        self.client = MongoClient(mongodb_uri)
        self.general_input_db = self.client[general_input_db_name]
        self.seismic_flooding_db = self.client[seismic_flooding_db_name]

        self.general_input = self.general_input_db["General_Input"]

        self.mainshock_ft = self.general_input_db["mainshock_ft"]
        self.tsunami_events_collection = self.seismic_flooding_db["Tsunami_events"]
        self.tsunami_fault_tree_templates = self.seismic_flooding_db["Tsunami_ft_temp"]

        # Fetch max_wave_heights and MS_vector from the database
        general_input_data = self.general_input.find_one({})
        self.mwh_vector = general_input_data["Tsunami"]["max_wave_heights"]
        self.ms_vector = general_input_data["Mainshock"]["MS_vector"]

        # Initialize global variables
        self.room_id = None
        self.ssc_name = None
        self.ssc_description = None
        self.ssc_document = None

    def create_tsunami_fault_tree(self, ssc_document):
        """
        Create the Tsunami fault tree based on the provided SSC document.

        Parameters:
        - ssc_document: Tsunami SSC document

        Returns:
        None
        """
        self.room_id = str(ssc_document.get("room_id"))
        self.ssc_name = str(ssc_document.get("name"))
        self.ssc_description = str(ssc_document.get("description"))

        # Fetch a copy of the MongoDB document with TSU-FT as an id
        ssc_tsunami_ft =copy.deepcopy(self.tsunami_fault_tree_templates.find_one({"id": "TSU-FT"}))
        if ssc_tsunami_ft is None:
            raise ValueError("Tsunami fault tree template 'TSU-FT' not found.")
        self.replace_placeholders(ssc_tsunami_ft,self.room_id, self.ssc_name, self.ssc_description, None, None,None,None)
        # Iterate over ms_vector and call create_fault_tree_PGA_bin in each loop
        for pga_bin_num, _ in enumerate(self.ms_vector, start=1):
            # Call create_fault_tree_PGA_bin method for each PGA bin
            pga_bin_tree = self.create_fault_tree_PGA_bin(pga_bin_num,ssc_document)

            # Append the inputs of ssc_tsunami_ft with the return of create_fault_tree_PGA_bin
            ssc_tsunami_ft["inputs"].append(pga_bin_tree)
        self.remove_object_ids(ssc_tsunami_ft)
        return ssc_tsunami_ft



    def create_fault_tree_PGA_bin(self, pga_bin_num,ssc_document):
        # Fetch the MongoDB document for the PGA fault tree template
        pga_ft = self.tsunami_fault_tree_templates.find_one({"id": "TSU-MS"})

        # Ensure the fault tree template is found
        if pga_ft is None:
            raise ValueError("Fault tree template 'TSU-MS' not found.")

        # Create a copy of the PGA fault tree template
        pga_ft_copy = copy.deepcopy(pga_ft)
        self.replace_placeholders(pga_ft_copy,self.room_id, self.ssc_name, None, self.ms_vector[pga_bin_num-1], pga_bin_num,None,None)

        # Iterate over the maximum wave height (MWH) vector
        for mwh_bin_num, mwh_bin_value in enumerate(self.mwh_vector, start=1):
            # Call create_gates_MWH_bin for each wave height bin
            mwh_gate = self.create_gates_MWH_bin(pga_bin_num, mwh_bin_num,ssc_document)

            # Append the return of create_gates_MWH_bin to the copy of pga_ft
            pga_ft_copy["inputs"].append(mwh_gate)


        return pga_ft_copy


    def create_gates_MWH_bin(self, pga_bin_num, mwh_bin_num,ssc_document):  # MWH: maximum wave height
        """
        Create gates in the fault tree for each wave height bin.

        Parameters:
        - pga_bin_num: PGA bin number
        - mwh_bin_num: Maximum wave height bin number

        Returns:
        Gate object for the specified wave height bin
        """
        mwh_gate = copy.deepcopy(self.tsunami_fault_tree_templates.find_one({"id": "TSU-MS-MWH"}))

        # Error handling for missing gate template
        if mwh_gate is None:
            raise ValueError("Gate template 'TSU-MS-MWH' not found.")

        ms_he = copy.deepcopy(self.tsunami_events_collection.find_one({"id": "HE-MS"}))
        # Add error handling for missing house event template
        if ms_he is None:
            raise ValueError("House event template 'MS-BE' not found.")

        self.replace_placeholders(ms_he, self.room_id, self.ssc_name, None, self.ms_vector[pga_bin_num-1], pga_bin_num,mwh_bin_num,None
                                  )

        mwh_he = copy.deepcopy(self.tsunami_events_collection.find_one({"id": "HE-MWH"}))
        if mwh_he is None:
            raise ValueError("House event template 'HE-MWH' not found.")

        self.replace_placeholders(mwh_he, self.room_id, self.ssc_name, None, self.ms_vector[pga_bin_num-1], pga_bin_num,mwh_bin_num,self.mwh_vector[mwh_bin_num-1]
                        )


        mwh_gate["inputs"].append(ms_he)
        mwh_gate["inputs"].append(mwh_he)


        self.create_change_set(ms_he,mwh_he,pga_bin_num,mwh_bin_num)


        # Calculate probability of mwh given an earthquake PGA bin
        if mwh_bin_num == 1:

            max_wave_height_range = [0, self.mwh_vector[0]]
        else:
            max_wave_height_range = [self.mwh_vector[mwh_bin_num - 2], self.mwh_vector[mwh_bin_num - 1]]

        pga_bin_value = self.ms_vector[pga_bin_num - 1]
        mwh_probability = self.calculate_mwh_probability(pga_bin_value, max_wave_height_range)

        mwh_conditional_probability_event = copy.deepcopy(self.tsunami_events_collection.find_one({"id": "TSU-CP"}))
        if mwh_conditional_probability_event is None:
            raise ValueError("Conditional probability event template 'TSU-CP' not found.")

        mwh_conditional_probability_event["failure_model"]["prob"] = mwh_probability
        self.replace_placeholders(mwh_conditional_probability_event, self.room_id, self.ssc_name, None, self.ms_vector[pga_bin_num-1], pga_bin_num, mwh_bin_num,self.mwh_vector[mwh_bin_num-1])

        # Append the conditional probability event to the mwh_gate
        mwh_gate["inputs"].append(mwh_conditional_probability_event)

        # Update the failure model of the tsunami event and append it to mwh_gate
        tsunami_document = copy.deepcopy(ssc_document)

        tsunami_document["failure_model"]["max_wave_height"] = self.mwh_vector[mwh_bin_num-1]
        tsunami_document["name"] += f"-MWH-{mwh_bin_num}"
        mwh_gate["inputs"].append(tsunami_document)


        self.replace_placeholders(mwh_gate,self.room_id, self.ssc_name, self.ssc_description, self.ms_vector[pga_bin_num-1], pga_bin_num, mwh_bin_num,self.mwh_vector[mwh_bin_num-1])

        return mwh_gate

    def calculate_mwh_probability(self, pga_value, max_wave_height_range):
        """
        Calculate the probability of maximum wave height given an earthquake PGA value and wave height range.

        Parameters:
        - pga_value: PGA value
        - max_wave_height_range: Range of maximum wave height

        Returns:
        Probability of maximum wave height
        """
        alpha = 1
        beta = 1
        std_error = 0.5
        mean_tsunami_height = alpha + beta * (10 * pga_value) ** 1.6

        mu_ln = np.log(mean_tsunami_height) - 0.5 * std_error ** 2
        sigma_ln = std_error

        tsunami_height_dist = stats.lognorm(scale=np.exp(mu_ln), s=sigma_ln)

        lower_bound_prob = tsunami_height_dist.cdf(max_wave_height_range[0])
        upper_bound_prob = tsunami_height_dist.cdf(max_wave_height_range[1])

        range_probability = upper_bound_prob - lower_bound_prob

        return range_probability

    def replace_placeholders(self, json_obj, room_id=None, ssc_name=None, ssc_description=None, PGA_bin=None,
                             PGA_bin_num=None, mwh_bin_num=None, mwh_bin_value=None):
        if isinstance(json_obj, dict):
            for key, value in json_obj.items():
                if isinstance(value, str):
                    # Replace placeholders with correct values
                    if ssc_name is not None:
                        value = value.replace("[ssc_name]", ssc_name)
                    if ssc_description is not None:
                        value = value.replace("[ssc_description]", ssc_description)
                    if room_id is not None:
                        value = value.replace("[room_id]", str(room_id))
                    if PGA_bin is not None:
                        value = value.replace("[PGA_bin]", str(PGA_bin))
                    if PGA_bin_num is not None:
                        value = value.replace("[PGA_bin_num]", str(PGA_bin_num))
                    if mwh_bin_num is not None:
                        value = value.replace("[mwh_bin_num]", str(mwh_bin_num))
                    if mwh_bin_value is not None:
                        value = value.replace("[mwh_bin]", str(mwh_bin_value))
                    json_obj[key] = value

                elif isinstance(value, (dict, list)):
                    self.replace_placeholders(value, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num,
                                              mwh_bin_num, mwh_bin_value)

        elif isinstance(json_obj, list):
            for item in json_obj:
                self.replace_placeholders(item, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num, mwh_bin_num,
                                          mwh_bin_value)


    def remove_object_ids(self, obj):
        if isinstance(obj, dict):
            # If it's a dictionary, iterate through its keys and values
            for key, value in obj.items():
                # Recursively process each value
                obj[key] = self.remove_object_ids(value)
        elif isinstance(obj, list):
            # If it's a list, iterate through its elements
            for i, item in enumerate(obj):
                # Recursively process each item
                obj[i] = self.remove_object_ids(item)
        elif isinstance(obj, ObjectId):
            # If it's an ObjectId, convert it to a string
            return str(obj)

        return obj

    def create_change_set(self, ms_he, mwh_he, pga_bin_num, mwh_bin_num):
        # Fetch the change set template from the database
        ms_mwh_cs_template = self.tsunami_events_collection.find_one({"type": "TSU-CS"})
        if ms_mwh_cs_template is None:
            raise ValueError("Change set template 'TSU-CS' not found.")

        # Create a copy of the change set template
        ms_mwh_cs = copy.deepcopy(ms_mwh_cs_template)

        # Generate a new ObjectId for the document
        ms_mwh_cs["_id"] = ObjectId()

        # Add events and change rules to the change set document
        ms_he_name = ms_he.get("name")
        mwh_he_name = mwh_he.get("name")
        if ms_he_name is None or mwh_he_name is None:
            raise ValueError("Event name not found in one of the documents.")

        ms_mwh_cs["events"].append(str(ms_he_name))
        ms_mwh_cs["change_rules"].append("T")
        ms_mwh_cs["events"].append(str(mwh_he_name))
        ms_mwh_cs["change_rules"].append("T")

        # Replace placeholders in the change set document
        self.replace_placeholders(ms_mwh_cs, None, None, None, None, pga_bin_num, mwh_bin_num)

        # Access the Tsunami_change_sets collection in the seismic_flooding_db database
        tsunami_change_sets_collection = self.seismic_flooding_db["Tsunami_change_sets"]

        # Insert the ms_mwh_cs document into the Tsunami_change_sets collection
        tsunami_change_sets_collection.insert_one(ms_mwh_cs)

def main():
    # MongoDB connection parameters
    mongodb_uri = "mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/"
    general_input_db_name = "MultiHazards_PRA_General"
    seismic_flooding_db_name = "seismic_flooding_database"

    # Instantiate the TsunamiFaultTree class
    tsunami_fault_tree =TsunamiFaultTree(mongodb_uri,
                     general_input_db_name,
                     seismic_flooding_db_name)

    # Connect to the seismic_flooding_db
    client = MongoClient(mongodb_uri)
    seismic_flooding_db = client[seismic_flooding_db_name]

    # Fetch the SSC document from the Tsunami_events collection
    ssc_document = seismic_flooding_db["Tsunami_events"].find_one({"name": "CMP-20"})

    if ssc_document is None:
        raise ValueError("SSC document not found in the Tsunami_events collection.")

    # Create the Tsunami fault tree
    tsunami_fault_tree_ssc_20=tsunami_fault_tree.create_tsunami_fault_tree(ssc_document)
    print(tsunami_fault_tree_ssc_20)

    # Build the tree in  the TreeBuilder class
    ft = TreeBuilder(mongodb_uri, general_input_db_name)
    ft.build_tree(tsunami_fault_tree_ssc_20)
    # Print the tree hierarchy with node information
    current_dir = os.path.dirname(os.path.abspath(__file__))
    ft.write_mard("tsunami", current_dir)

    # Change sets for tsunami events
    flag_set_writer = FlagSetWriter(mongodb_uri, general_input_db_name,seismic_flooding_db_name)
    flag_set_writer.main(current_dir)
if __name__ == "__main__":
    main()