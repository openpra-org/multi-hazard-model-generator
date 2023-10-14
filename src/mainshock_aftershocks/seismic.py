from src.imports import *
from tree_builder import TreeBuilder
class SeismicEvent:
    def __init__(self, mongodb_uri, db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]

        self.ssc_seismic = self.db["components"]
        self.general_input = self.db["General_Input"]
        self.mainshock_ft = self.db["mainshock_ft"]

    def generate_mainshock_fault_tree(self):
        # Mainshock PGA bins
        ms_vector = self.general_input.find_one({}, {"Mainshock.MS_vector": 1})

        if ms_vector is None:
            raise ValueError("MS_vector is not found in the database.")

        ms_vector_values = ms_vector.get("Mainshock", {}).get("MS_vector", None)

        if not ms_vector_values:
            raise ValueError("MS_vector is empty or not an array of numbers.")

        if not all(isinstance(value, (int, float)) for value in ms_vector_values):
            raise ValueError("MS_vector contains non-numeric values.")



        cursor = self.ssc_seismic.find({})
        for ssc_document in cursor:
            # Call the mainshock fault tree template

            room_id = str(ssc_document.get("room_id"))
            ssc_name = str(ssc_document.get("name"))
            ssc_description = str(ssc_document.get("description"))
            mainshock_ft_template = self.mainshock_ft.find_one({"id": "MSFT"})
            self.replace_placeholders(mainshock_ft_template,room_id,ssc_name,ssc_description)
            self.remove_object_ids(mainshock_ft_template)


            # Append the output of create_mainshock_pga_gate to mainshock_ft_template's inputs
            mainshock_ft_template["inputs"].extend(self.create_mainshock_pga_gate(ssc_document,ms_vector_values))

            # Now you have the updated mainshock_ft_template

            # Return or use the updated mainshock_ft_template outside the loop
        return mainshock_ft_template

    def create_mainshock_pga_gate(self, ssc_document, ms_vector_values):
        room_id = str(ssc_document.get("room_id"))
        ssc_name = str(ssc_document.get("name"))
        ssc_description = str(ssc_document.get("description"))
        mainshock_gate_bins = []  # List to store the mainshock_gate_bin objects

        if 'type' in ssc_document and ssc_document['type'] == 'SBE':
            for bin_num, ms_bin in enumerate(ms_vector_values, start=1):
                failure_model_params = ssc_document.get("failure_model", {})
                failure_model_params["pga"] = ms_bin
                mainshock_gate_bin = self.mainshock_ft.find_one({"id": "MSGT"})

                for input in mainshock_gate_bin['inputs']:
                    if 'id' in input and input['id'] == 'MS-BE':
                        input["failure_model_params"] = failure_model_params
                        self.replace_placeholders(mainshock_gate_bin, room_id, ssc_name, ssc_description, ms_bin,
                                                  bin_num)
                        self.remove_object_ids(mainshock_gate_bin)
                        mainshock_gate_bins.append(mainshock_gate_bin)
        return mainshock_gate_bins

    def replace_placeholders(self, json_obj, room_id=None, ssc_name=None, ssc_description=None, PGA_bin=None,
                             PGA_bin_num=None):
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
                    json_obj[key] = value
                elif isinstance(value, (dict, list)):
                    self.replace_placeholders(value, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num)
        elif isinstance(json_obj, list):
            for item in json_obj:
                self.replace_placeholders(item, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num)

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

def main():
    mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net'
    general_db_name = 'MultiHazards_PRA_General'

    # Usage example
    tree = SeismicEvent(mongodb_uri, general_db_name)
    mainshock_ft_template = tree.generate_mainshock_fault_tree()

    # Assuming you want to create and visualize the tree using TreeBuilder
    ft = TreeBuilder(mongodb_uri, general_db_name)
    ft.build_tree(mainshock_ft_template)
    ft.visualize_tree()

if __name__ == "__main__":
    main()


