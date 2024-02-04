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

        self.mwh_vector = self.general_input.find_one({}, {"Tsunami.max_wave_heights": 1})
        self.mwh_vector =  self.mwh_vector["Tsunami"]["max_wave_heights"]
        self.ms_vector = self.general_input.find_one({}, {"Mainshock.MS_vector": 1})
        self.ms_vector  = self.ms_vector["Mainshock"]["MS_vector"]
        # Initialize global variables
        self.room_id = None
        self.ssc_name = None

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

    def create_fault_tree_PGA_bin(self, pga_bin):
        # Method to create the Tsunami fault tree given the PGA bin
        pass

    def create_gates_MWH_bin(self, pga_bin_num, mwh_bin_num):  # MWH: maximum wave height
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

        self.replace_placeholders(ms_he, self.room_id, self.ssc_name, None, self.ms_vector[mwh_bin_num], pga_bin_num,mwh_bin_num
                                  )

        mwh_he = copy.deepcopy(self.tsunami_events_collection.find_one({"id": "HE-MWH"}))
        if mwh_he is None:
            raise ValueError("House event template 'HE-MWH' not found.")

        self.replace_placeholders(mwh_he, self.room_id, self.ssc_name, None, self.ms_vector[mwh_bin_num], pga_bin_num,mwh_bin_num
                        )

        mwh_gate["inputs"].append(ms_he)
        mwh_gate["inputs"].append(mwh_he)



        # Calculate probability of mwh given an earthquake PGA bin
        if mwh_bin_num == 1:

            max_wave_height_range = [0, self.mwh_vector[0]]
        else:
            max_wave_height_range = [self.mwh_vector[mwh_bin_num - 2], self.mwh_vector[mwh_bin_num - 1]]

        pga_bin_value = self.ms_vector[pga_bin_num - 1]
        print(pga_bin_value)
        mwh_probability = self.calculate_mwh_probability(pga_bin_value, max_wave_height_range)

        mwh_conditional_probability_event = copy.deepcopy(self.tsunami_events_collection.find_one({"type": "TSU-CP"}))
        if mwh_conditional_probability_event is None:
            raise ValueError("Conditional probability event template 'TSU-CP' not found.")

        mwh_conditional_probability_event["failure_model"]["prob"] = mwh_probability
        self.replace_placeholders(mwh_conditional_probability_event, self.room_id, self.ssc_name, None, self.ms_vector[mwh_bin_num], pga_bin_num, mwh_bin_num)


        mwh_gate["inputs"].append(mwh_conditional_probability_event)

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
                             PGA_bin_num=None, mwh_bin=None):
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
                    if mwh_bin is not None:
                        value = value.replace("[mwh_bin]", str(mwh_bin))
                    json_obj[key] = value

                elif isinstance(value, (dict, list)):
                    self.replace_placeholders(value, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num, mwh_bin)

        elif isinstance(json_obj, list):
            for item in json_obj:
                self.replace_placeholders(item, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num, mwh_bin)



