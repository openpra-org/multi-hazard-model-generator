from src.imports import *
from tree_builder import TreeBuilder
class SeismicEvent:
    def __init__(self, mongodb_uri, db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]

        self.ssc_seismic = self.db["components"]
        self.general_input = self.db["General_Input"]
        self.mainshock_ft = self.db["mainshock_ft"]
        self.aftershocks_ft = self.db["aftershocks_ft"]


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
                             PGA_bin_num=None, Time=None, Time_bin_num=None):
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
                    if Time is not None:
                        value = value.replace("[Time]", str(Time))
                    if Time_bin_num is not None:
                        value = value.replace("[Time_bin_num]", str(Time_bin_num))
                    json_obj[key] = value
                elif isinstance(value, (dict, list)):
                    self.replace_placeholders(value, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num, Time,
                                              Time_bin_num)
        elif isinstance(json_obj, list):
            for item in json_obj:
                self.replace_placeholders(item, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num, Time,
                                          Time_bin_num)

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


    def create_aftershock_time_gate(self,ssc_document,MS_bin_num,aftershock_data,time_bin,Time):

        room_id = str(ssc_document.get("room_id"))
        ssc_name = str(ssc_document.get("name"))
        ssc_description = str(ssc_document.get("description"))
        aftershock_time_gate=self.aftershocks_ft.find_one({"id": "ASTGT"})
        aftershock_time_gate_copy = copy.deepcopy(aftershock_time_gate)

        self.replace_placeholders(aftershock_time_gate_copy,room_id,ssc_name,ssc_description,PGA_bin=None, PGA_bin_num=MS_bin_num,Time=Time,Time_bin_num=time_bin)


        return aftershock_time_gate_copy

    def create_aftershock_MS_ft(self, aftershocks_data, ssc_document, PGA_bin_num, PGA_bin):

        room_id = str(ssc_document.get("room_id"))
        ssc_name = str(ssc_document.get("name"))
        ssc_mission = ssc_document.get("mission")
        ssc_description = str(ssc_document.get("description"))
        delta_t = aftershocks_data["dt"]
        aftershock_mainshock_fault_tree = self.aftershocks_ft.find_one({"id": "ASMSFT"})
        aftershock_mainshock_fault_tree_copy = copy.deepcopy(aftershock_mainshock_fault_tree)

        if 'type' in ssc_document and ssc_document['type'] == 'SBE':
            if ssc_mission and len(ssc_mission) == 2:
                start_mission = ssc_mission[0]
                end_mission = ssc_mission[1]

                # Iterate over ssc_mission with delta_t step, and enumerate with index starting from 1
                for time_bin, time in enumerate(range(start_mission, end_mission + 1, delta_t), start=1):
                    time_gate = self.create_aftershock_time_gate(ssc_document, PGA_bin_num, aftershocks_data, time_bin,
                                                                 time)
                    time_gate = self.remove_object_ids(time_gate)
                    self.replace_placeholders(aftershock_mainshock_fault_tree_copy,room_id,ssc_name,ssc_description,PGA_bin,PGA_bin_num,Time=None,Time_bin_num=None)
                    # Append time_gate to the inputs array of the aftershock_mainshock_fault_tree_copy dictionary
                    if "inputs" in aftershock_mainshock_fault_tree_copy:
                        aftershock_mainshock_fault_tree_copy["inputs"].append(time_gate)

        return aftershock_mainshock_fault_tree_copy

    def create_aftershocks_main_gate(self):

        # Load aftershocks data and check if aftershocks are considered
        aftershocks_data = self.get_aftershocks_data(self.general_input)
        consider_aftershocks = aftershocks_data.get('consider_aftershocks')
        MS_vector=self.general_input.find_one({}, {"Mainshock.MS_vector": 1})
        MS_vector = MS_vector['Mainshock']['MS_vector']
        aftershock_main_gate_temp = self.aftershocks_ft.find_one({"id": "ASFT"})

        aftershock_main_gate_temp_copies = {}

        if consider_aftershocks == 'Yes':

            cursor = self.ssc_seismic.find({})
            for ssc_document in cursor:

                room_id = str(ssc_document.get("room_id"))
                ssc_name = str(ssc_document.get("name"))
                ssc_mission = ssc_document.get("mission")
                ssc_description = str(ssc_document.get("description"))

                aftershock_main_gate_temp_copy = copy.deepcopy(aftershock_main_gate_temp)
                self.replace_placeholders(aftershock_main_gate_temp_copy,room_id,ssc_name,ssc_description,PGA_bin=None,PGA_bin_num=None,Time=None,Time_bin_num=None)

                for PGA_bin_num,PGA_bin in enumerate(MS_vector,start =1):

                    aftershock_main_gate=self.create_aftershock_MS_ft(aftershocks_data,ssc_document,PGA_bin_num,PGA_bin)
                    self.add_aftershock_mainshock_gate(aftershock_main_gate_temp_copy,aftershock_main_gate)
                    self.remove_object_ids(aftershock_main_gate_temp_copy)
                    key = f'{room_id}-{ssc_name}'

                    aftershock_main_gate_temp_copies[key] = aftershock_main_gate_temp_copy

        return aftershock_main_gate_temp_copies
    def add_aftershock_mainshock_gate(self, json_obj, aftershock_mainshock_gate):
        # Find and update all elements with "id" equal to "ASGT"
        for input_obj in json_obj["inputs"]:
            if "id" in input_obj and input_obj["id"] == "ASGT":
                input_obj["inputs"].append(aftershock_mainshock_gate)

        return json_obj

    def get_aftershocks_data(self,general_input):
        general_input_data = general_input.find_one({})
        aftershocks_data = {}

        if general_input_data and 'Aftershocks' in general_input_data:
            aftershocks_data = general_input_data['Aftershocks']

        return aftershocks_data



    def mean_aftershocks_number(self, aftershocks_params, mainshock_PGA, S, E):

        a = aftershocks_params["AF_arrival_params"]["a"]  # Read 'a' from aftershock_params
        b = aftershocks_params["AF_arrival_params"]["b"]  # Read 'b' from aftershock_params
        c = aftershocks_params["AF_arrival_params"]["c"]  # Read 'c' from aftershock_params
        p = aftershocks_params["AF_arrival_params"]["p"]  # Read 'p' from aftershock_params
        alpha = aftershocks_params["AF_arrival_params"]["alpha"]  # Read 'alpha' from aftershock_params
        aftershocks_acceleration_vector = aftershocks_params[
            "vector"]  # Use the aftershock vector from aftershock_params

        number_aftershocks = [
            ((10) ** a) * ((mainshock_PGA / aftershock_PGA) ** (alpha * b)) * (1 / (1 - p)) * (
                    (E + c) ** (1 - p) - (S + c) ** (1 - p))
            for aftershock_PGA in aftershocks_acceleration_vector
        ]

        aftershock_acceleration_array = np.array(aftershocks_acceleration_vector)
        geometric_mean = np.sqrt(aftershock_acceleration_array[:-1] * aftershock_acceleration_array[1:])

        return number_aftershocks[:-1], geometric_mean



    def correlation_class(self):
        # A correlation class object should be added to SSCs documents
        # If the correlation is required this method is activated
        pass
def main():
    mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net'
    general_db_name = 'MultiHazards_PRA_General'

    # Usage example
    tree = SeismicEvent(mongodb_uri, general_db_name)
    mainshock_ft_template = tree.generate_mainshock_fault_tree()
    aftershock_gate = tree.create_aftershocks_main_gate()
    first_item = next(iter(aftershock_gate.values()))
    print(first_item)
    # Assuming you want to create and visualize the tree using TreeBuilder
    ft = TreeBuilder(mongodb_uri, general_db_name)
    ft.build_tree(first_item)
    ft.visualize_tree()
    #ft.write_mard()

if __name__ == "__main__":
    main()


