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

        self.ASTGT_dict ={}
        self.ASTFT_dict = {}
        self.NOR_time_aftershock_fault_trees_per_MS = {}
        self.mainshock_ft_templates = {}  # Global dictionary to store mainshock_ft_templates

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
        self.mainshock_ft_templates = {}
        for ssc_document in cursor:
            # Call the mainshock fault tree template

            room_id = str(ssc_document.get("room_id"))
            ssc_name = str(ssc_document.get("name"))
            ssc_description = str(ssc_document.get("description"))
            mainshock_ft_template = self.mainshock_ft.find_one({"id": "MSFT"})
            self.replace_placeholders(mainshock_ft_template, room_id, ssc_name, ssc_description)
            self.remove_object_ids(mainshock_ft_template)

            # Append the output of create_mainshock_pga_gate to mainshock_ft_template's inputs
            mainshock_ft_template["inputs"].extend(self.create_mainshock_pga_gate(ssc_document, ms_vector_values))

            # Store the mainshock_ft_template in the global dictionary
            self.mainshock_ft_templates[(room_id, ssc_name)] = mainshock_ft_template





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
                             PGA_bin_num=None, Time=None, Time_bin_num=None,AF_bin_num = None):
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

                    if AF_bin_num is not None:
                        value = value.replace("[AF_bin_num]", str(AF_bin_num))
                    json_obj[key] = value

                elif isinstance(value, (dict, list)):
                    self.replace_placeholders(value, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num, Time,
                                              Time_bin_num,AF_bin_num)
        elif isinstance(json_obj, list):
            for item in json_obj:
                self.replace_placeholders(item, room_id, ssc_name, ssc_description, PGA_bin, PGA_bin_num, Time,
                                          Time_bin_num,AF_bin_num)

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








    def create_aftershock_time_gate(self, ssc_document, MS_bin_num, aftershock_data, time_bin_num, Time,
                                    NOR_time_aftershock_fault_trees_per_MS):

        room_id = str(ssc_document.get("room_id"))
        ssc_name = str(ssc_document.get("name"))
        ssc_description = str(ssc_document.get("description"))
        aftershock_time_gate = self.aftershocks_ft.find_one({"id": "ASTGT"})
        aftershock_time_gate_copy = copy.deepcopy(aftershock_time_gate)
        compound_event_gate=self.create_aftershock_compound_event_gate(ssc_document,MS_bin_num,time_bin_num,Time)


        self.update_inputs(aftershock_time_gate_copy,"ASTFT",compound_event_gate)


        self.replace_placeholders(aftershock_time_gate_copy, room_id, ssc_name, ssc_description, PGA_bin=None,
                                  PGA_bin_num=MS_bin_num, Time=Time, Time_bin_num=time_bin_num)



        #self.add_ASTG_to_nor_aftershock_time_ft(NOR_time_aftershock_fault_trees_per_MS, time_bin_num)
        #self.add_aftershock_compound_event_gate(aftershock_time_gate_copy)

        self.add_nor_fault_tree_inputs(aftershock_time_gate_copy, NOR_time_aftershock_fault_trees_per_MS, time_bin_num)

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
                start_mission = ssc_mission[0] + delta_t
                end_mission = ssc_mission[1]

                self.NOR_time_aftershock_fault_trees_per_MS = {}

                NOR_time_aftershock_fault_trees_per_MS = self.create_nor_fault_tree_aftershocks(ssc_document,
                                                                                                aftershocks_data,
                                                                                                PGA_bin_num)

                # Iterate over ssc_mission with delta_t step, and enumerate with index starting from 1
                for time_bin, time in enumerate(range(start_mission, end_mission + 1, delta_t), start=1):
                    self.ASTGT_dict = {}
                    time_gate = self.create_aftershock_time_gate(ssc_document, PGA_bin_num, aftershocks_data, time_bin,
                                                                 time, NOR_time_aftershock_fault_trees_per_MS)
                    time_gate = self.remove_object_ids(time_gate)
                    self.replace_placeholders(aftershock_mainshock_fault_tree_copy, room_id, ssc_name, ssc_description,
                                              PGA_bin, PGA_bin_num, Time=None, Time_bin_num=None)
                    # Append time_gate to the inputs array of the aftershock_mainshock_fault_tree_copy dictionary
                    if "inputs" in aftershock_mainshock_fault_tree_copy:
                        aftershock_mainshock_fault_tree_copy["inputs"].append(time_gate)

        #print(aftershock_mainshock_fault_tree_copy)
        return aftershock_mainshock_fault_tree_copy

    def create_aftershocks_main_gate(self):

        # Load aftershocks data and check if aftershocks are considered
        aftershocks_data = self.get_aftershocks_data(self.general_input)
        consider_aftershocks = aftershocks_data.get('consider_aftershocks')
        MS_vector = self.general_input.find_one({}, {"Mainshock.MS_vector": 1})
        MS_vector = MS_vector['Mainshock']['MS_vector']
        aftershock_main_gate_temp = self.aftershocks_ft.find_one({"id": "ASFT"})




        aftershock_main_gate_temp_copies = {}

        if consider_aftershocks == 'Yes':
            output_dir = "output"  # Name of the output directory
            if not os.path.exists(output_dir):
                os.makedirs(output_dir)

            cursor = self.ssc_seismic.find({})
            for ssc_document in cursor:

                room_id = str(ssc_document.get("room_id"))
                ssc_name = str(ssc_document.get("name"))
                ssc_mission = ssc_document.get("mission")
                ssc_description = str(ssc_document.get("description"))

                aftershock_main_gate_temp_copy = copy.deepcopy(aftershock_main_gate_temp)

                # Add MSFT to NOMSFT

                self.update_inputs(aftershock_main_gate_temp_copy, "NOMSFT", self.mainshock_ft_templates[(room_id, ssc_name)])

                self.replace_placeholders(aftershock_main_gate_temp_copy, room_id, ssc_name, ssc_description,
                                          PGA_bin=None, PGA_bin_num=None, Time=None, Time_bin_num=None)

                for PGA_bin_num, PGA_bin in enumerate(MS_vector, start=1):
                    aftershock_main_gate = self.create_aftershock_MS_ft(aftershocks_data, ssc_document, PGA_bin_num,
                                                                        PGA_bin)
                    self.add_aftershock_mainshock_gate(aftershock_main_gate_temp_copy, aftershock_main_gate)
                    self.remove_object_ids(aftershock_main_gate_temp_copy)
                    key = f'{room_id}-{ssc_name}'

                    aftershock_main_gate_temp_copies[key] = aftershock_main_gate_temp_copy

                # Create a unique JSON filename based on room_id and ssc_name
                json_filename = os.path.join(output_dir, f'{room_id}-{ssc_name}.json')

                # Serialize and write the aftershock_main_gate_temp_copy to the JSON file
                with open(json_filename, 'w') as json_file:
                    json.dump(aftershock_main_gate_temp_copy, json_file, indent=4)
        return aftershock_main_gate_temp_copies

    def add_aftershock_mainshock_gate(self, json_obj, aftershock_mainshock_gate):
        # Find and update all elements with "id" equal to "ASGT"
        for input_obj in json_obj["inputs"]:
            if "id" in input_obj and input_obj["id"] == "ASGT":
                input_obj["inputs"].append(aftershock_mainshock_gate)

        return json_obj

    def add_nor_fault_tree_inputs(self, aftershock_time_gate_copy, NOR_time_aftershock_fault_trees_per_MS, time_bin):

        if "inputs" in aftershock_time_gate_copy:
            inputs = aftershock_time_gate_copy["inputs"]
            if inputs and isinstance(inputs, list):
                # Iterate through NOR_time_aftershock_fault_trees_per_MS
                for key, value in NOR_time_aftershock_fault_trees_per_MS.items():
                    # Check if the key (time bin) is below the specified time_bin
                    if key < time_bin:
                        # Append the value (NOR fault tree) to the inputs array
                        inputs.append(value)

    def get_aftershocks_data(self, general_input):
        general_input_data = general_input.find_one({})
        aftershocks_data = {}

        if general_input_data and 'Aftershocks' in general_input_data:
            aftershocks_data = general_input_data['Aftershocks']

        return aftershocks_data

    def create_nor_fault_tree_aftershocks(self, ssc_document, aftershocks_data, MS_bin_num):
        # Provide values for all the placeholders
        room_id = None  # Replace with the actual value if needed

        ssc_name = str(ssc_document.get("name"))
        ssc_mission = ssc_document.get("mission")
        ssc_description = str(ssc_document.get("description"))
        delta_t = aftershocks_data["dt"]

        ms_vector = self.general_input.find_one({}, {"Mainshock.MS_vector": 1})
        ms_vector_values = ms_vector.get("Mainshock", {}).get("MS_vector", None)

        start_mission = ssc_mission[0] + delta_t
        end_mission = ssc_mission[1]

        nor_fault_tree_aftershocks_json_objects = {}

        aftershock_nor_fault_tree_template = self.aftershocks_ft.find_one({"id": "NORAS"})

        for time_bin, time in enumerate(range(start_mission, end_mission + 1, delta_t), start=1):
            aftershock_nor_fault_tree_template_copy = copy.deepcopy(aftershock_nor_fault_tree_template)

            aftershock_time_gate = self.aftershocks_ft.find_one({"id": "ASTGT"})
            aftershock_time_gate_copy = copy.deepcopy(aftershock_time_gate)
            compound_event_gate = self.create_aftershock_compound_event_gate(ssc_document, MS_bin_num, time_bin,
                                                                             time)
            #print(compound_event_gate)
            self.update_inputs(aftershock_time_gate_copy, "ASTFT", compound_event_gate)

            ASTFT_doc=self.extract_ASTFT(aftershock_time_gate_copy,"ASTFT")


            # Add ASTFT document to NOR aftershock time fault tree
            aftershock_nor_fault_tree_template_copy["inputs"].append(ASTFT_doc)

            # Call the replace_placeholders method with all the values
            self.replace_placeholders(
                aftershock_nor_fault_tree_template_copy,
                room_id=room_id,
                ssc_name=ssc_name,
                ssc_description=ssc_description,
                PGA_bin=None,
                PGA_bin_num=MS_bin_num,
                Time=time,
                Time_bin_num=time_bin
            )


            # Store the created JSON object in the dictionary with Time_bin_num as the key
            nor_fault_tree_aftershocks_json_objects[time_bin] = aftershock_nor_fault_tree_template_copy


        return nor_fault_tree_aftershocks_json_objects



    def add_ASTG_to_nor_aftershock_time_ft(self,aftershock_nor_fault_tree_template_copy,time_bin):

        # Add aftershock time gate to the aftershock Nor time gate
        self.update_inputs(aftershock_nor_fault_tree_template_copy, "NORAS", self.ASTGT_dict[time_bin])

        return aftershock_nor_fault_tree_template_copy

    def mean_aftershocks_number(self, mainshock_PGA, time):

        aftershocks_params = self.get_aftershocks_data(self.general_input)
        delta_T = aftershocks_params["dt"]

        a = aftershocks_params["AF_arrival_params"]["a"]
        b = aftershocks_params["AF_arrival_params"]["b"]
        c = aftershocks_params["AF_arrival_params"]["c"]
        p = aftershocks_params["AF_arrival_params"]["p"]
        alpha = aftershocks_params["AF_arrival_params"]["alpha"]
        aftershocks_acceleration_vector = aftershocks_params["vector"]

        number_aftershocks = [
            ((10) ** a) * ((mainshock_PGA / aftershock_PGA) ** (alpha * b)) * (1 / (1 - p)) * (
                    (time+delta_T + c) ** (1 - p) - (time + c) ** (1 - p))
            for aftershock_PGA in aftershocks_acceleration_vector
        ]

        aftershock_acceleration_array = np.array(aftershocks_acceleration_vector)
        geometric_mean = np.sqrt(aftershock_acceleration_array[:-1] * aftershock_acceleration_array[1:])

        result_dict = {
            "geometric_mean": geometric_mean.tolist(),
            "number_aftershocks": number_aftershocks[:-1]
        }

        return result_dict

    def create_aftershock_compound_event_gate(self, ssc_document, MS_PGA_bin, Time_bin_num, time):
        ms_vector = self.general_input.find_one({}, {"Mainshock.MS_vector": 1})
        ms_vector_values = ms_vector.get("Mainshock", {}).get("MS_vector", None)
        aftershocks_data = self.get_aftershocks_data(self.general_input)

        room_id = str(ssc_document.get("room_id"))
        ssc_name = str(ssc_document.get("name"))
        ssc_description = str(ssc_document.get("description"))

        # Initialize an empty list to store templates
        aftershock_templates_list = []

        mean_aftershock_pga_bin = self.mean_aftershocks_number(ms_vector_values[MS_PGA_bin - 1], time)

        for key, value in mean_aftershock_pga_bin.items():

            if key == "geometric_mean":
                # Access the geometric_mean value
                geometric_mean = value
            elif key == "number_aftershocks":
                # Access the number_aftershocks value
                number_aftershocks = value
                for AF_bin_num, (mean_number_aftershocks, geometric_mean_pga) in enumerate(
                        zip(number_aftershocks, geometric_mean), start=1):
                    aftershock_compound_event_gate_template = copy.deepcopy(
                        self.aftershocks_ft.find_one({"id": "ASCEGT"}))

                    self.update_failure_model_value(aftershock_compound_event_gate_template, "AF-VE", "value",
                                                    mean_number_aftershocks)

                    self.replace_placeholders(aftershock_compound_event_gate_template, room_id, ssc_name,
                                              ssc_description, ms_vector_values[MS_PGA_bin - 1], MS_PGA_bin, time,
                                              Time_bin_num, AF_bin_num)
                    self.add_failure_model_aftershock_fragility_event(aftershock_compound_event_gate_template,
                                                                      ssc_document)
                    self.update_failure_model_value(aftershock_compound_event_gate_template, "AF-SE", "pga",
                                                    geometric_mean_pga)

                    # Append the template to the list
                    aftershock_templates_list.append(aftershock_compound_event_gate_template)

        return aftershock_templates_list

    def find_object_by_id(self, document, target_id, path=None):
        if path is None:
            path = []

        if isinstance(document, list):
            for index, item in enumerate(document):
                new_path = path + [index]
                result, result_path = self.find_object_by_id(item, target_id, new_path)
                if result:
                    return result, result_path
        elif isinstance(document, dict):
            if "id" in document and document["id"] == target_id:
                return document, path
            for key, value in document.items():
                new_path = path + [key]
                result, result_path = self.find_object_by_id(value, target_id, new_path)
                if result:
                    return result, result_path


        return None, []

    def update_failure_model_value(self, mongodb_document, target_id, string_param,new_value):
        found_object, path_to_object = self.find_object_by_id(mongodb_document, target_id)

        if found_object:
            # Check if the found object has a "failure_model" and update its "value"
            if "failure_model" in found_object:
                found_object["failure_model"][string_param] = new_value

            # Update the original document with the modified object
            current_object = mongodb_document
            for step in path_to_object[:-1]:
                current_object = current_object[step]
            current_object[path_to_object[-1]] = found_object

            # Return the updated document
            return mongodb_document

        return None  # Return None if the target_id is not found in the document

    def update_inputs(self, mongodb_document, target_id, new_objects):
        found_object, path_to_object = self.find_object_by_id(mongodb_document, target_id)

        if found_object:

            # Check if the found object has "inputs" and ensure it's a list
            if "inputs" in found_object and isinstance(found_object["inputs"], list):
                # Append the new objects to the "inputs" list
                found_object["inputs"].append(new_objects)
                # Update the original document with the modified "inputs"
                current_object = mongodb_document
                for step in path_to_object[:-1]:
                    current_object = current_object[step]
                current_object[path_to_object[-1]] = found_object

                # Return the updated document
                return mongodb_document

        return None  # Return None if the target_id is not found or if "inputs" is not a list

    def add_failure_model_aftershock_fragility_event(self,mongodb_document, ssc_document):
        extracted_failure_model = self.extract_object_mongodb(ssc_document, "failure_model")

        if extracted_failure_model:
            # Find the object with ID "AF-SE" in the MongoDB document
            af_se_obj, path_to_af_se = self.find_object_by_id(mongodb_document, "AF-SE")

            if af_se_obj:
                # Update the "failure_model" value under "AF-SE" with the extracted_failure_model
                af_se_obj["failure_model"] = extracted_failure_model
                return mongodb_document  # Return the updated document

        return None  # Return None if "AF-SE" or the extracted_failure_model is not found

    def extract_object_mongodb(self,mongodb_doc,extracted_obj):

        if extracted_obj in mongodb_doc:
            obj = mongodb_doc[extracted_obj]
            return obj
        else:
            return None


    def extract_ASTFT(self,document,target_id):
        if "inputs" in document:
            for input_obj in document["inputs"]:
                if input_obj.get("id") == target_id:
                    return input_obj
        return None






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
    #first_item = next(iter(aftershock_gate.values()))
    # Assuming you want to create and visualize the tree using TreeBuilder
    ft = TreeBuilder(mongodb_uri, general_db_name)
    #ft.build_tree(first_item)
    # ft.visualize_tree()
    # ft.write_mard()


if __name__ == "__main__":
    main()
