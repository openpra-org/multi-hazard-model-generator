
from tree_builder import TreeBuilder
from src.imports import *

class SeismicFireFaultTree:
    def __init__(self, mongodb_uri, db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]
        self.ssc_seismic_fire = self.db["components"]
        self.sources_collection = self.db["fire_sources"]
        self.rooms_collection = self.db["rooms"]
        self.fire_barriers_collection = self.db["thermal_barriers"]
        self.fire_gate_temp = self.db["fire_gate_temp"]
        self.fire_HRA_collection = self.db["Fire_HRA"]
        self.fire_propagation_temp =self.db["propagation_gate_temp"]
        self.fire_propagation_events = self.db["fire_propagation"]
        self.ssc_fault_tree_template =  self.db["ssc_ft_temp"]
        self.fire_sprinkler_collection = self.db["fire_sprinkler"]

        self.fire_room_gate_representations = {}  # Dictionary to store fire room gate_json_representation by room_id
        self.propagation_from_one_room_representation = {}  # Dictionary to store fire propagation from one room gate_json_representation by room_id
        self.fire_propagation_to_room_representation = {}  # Dictionary to store fire propagation to one room gate_json by room_id
        self.source_room_ids_dict = {}   # Dictionary to store source room ids with target room as key
        self.combination_of_fire_inside_propagation_dict = {}
        self.ssc_ft_representation = {}

    def ssc_fault_tree(self):
        # Get the fire_in_or_to_room_gate template
        fire_in_or_to_room_gate = self.ssc_fault_tree_template.find_one({"id": "SFR-RP"})

        # Iterate over documents in the self.ssc_seismic_fire collection
        cursor = self.ssc_seismic_fire.find({})

        for ssc_document in cursor:
            room_id = str(ssc_document.get("room_id"))
            ssc_name = str(ssc_document.get("name"))

            # Check if the room_id exists in the rooms_collection
            room_info = self.rooms_collection.find_one({"_id": ObjectId(room_id)})
            room_num = room_info.get("name") if room_info else None

            # Create a copy of the ssc_fault_tree_template
            ssc_fault_tree_copy = copy.deepcopy(self.ssc_fault_tree_template.find_one())

            # Build the fire_in_or_to_room_gate and add it to ssc_fault_tree_copy
            fire_in_or_to_room_gate_copy = copy.deepcopy(fire_in_or_to_room_gate)
            self.build_combine_fire_inside_propagate(fire_in_or_to_room_gate_copy, room_id, room_num)
            ssc_fault_tree_copy["inputs"].append(fire_in_or_to_room_gate_copy)

            # Replace placeholders and add failure event
            self.replace_placeholders(ssc_fault_tree_copy, room_id, room_num, ssc_name, ssc_document.get("description"))
            self.add_ssc_failure_event(room_id, ssc_fault_tree_copy, ssc_document)
            self.add_combined_fire_inside_propagate_to_ssc_ft(ssc_fault_tree_copy, fire_in_or_to_room_gate_copy)
            self.remove_object_ids(ssc_fault_tree_copy)
            self.remove_oid(ssc_fault_tree_copy)
            self.remove_id_keys(ssc_fault_tree_copy)
            # Store the result in the ssc_ft_representation dictionary
            self.ssc_ft_representation[ssc_name] = ssc_fault_tree_copy

        return self.ssc_ft_representation

    def add_combined_fire_inside_propagate_to_ssc_ft(self,ssc_ft,combined_doc):
        for index, input in enumerate(ssc_ft['inputs']):
            new_input = input
            if 'id' in input and input['id'] == 'SFR-RP':
                new_input = combined_doc
                ssc_ft['inputs'][index] = new_input

        return ssc_ft


    def build_combine_fire_inside_propagate(self,json_obj,room_id,room_num):

        self.add_fire_inside_room_gate(json_obj, room_id)
        self.add_fire_migrate_to_room_gate(json_obj, room_id)
        self.replace_placeholders(json_obj, room_id, room_num)

        self.combination_of_fire_inside_propagation_dict[room_id] = json_obj

        return json_obj

    def add_fire_inside_room_gate(self,json_obj,room_id):

        # Check if 'inputs' key exists in json_obj, if not, create it as an empty list
        if 'inputs' not in json_obj:
            json_obj['inputs'] = []

        # Create a new input document to add to the 'inputs' list
        new_input = {}

        # Check if the input has 'id' equal to 'SFP-MR0'
        if 'id' in json_obj and json_obj['id'] == 'SFR-RP':
            # Try to find the fire propagation gate document
            fire_inside_room = self.fire_room_gate_representations.get(room_id)
            if fire_inside_room:
                # If the document exists, update the 'room_id' field
                fire_inside_room['room_id'] = room_id
                # Append the updated document to the 'inputs' list
                json_obj['inputs'].append(fire_inside_room)
            else:
                warnings.warn(f"Fire propagation gate document not found for room_id: {room_id}", UserWarning)


    def add_fire_migrate_to_room_gate(self,json_obj,room_id):

        # Check if 'inputs' key exists in json_obj, if not, create it as an empty list
        if 'inputs' not in json_obj:
            json_obj['inputs'] = []

        # Create a new input document to add to the 'inputs' list
        new_input = {}

        # Check if the input has 'id' equal to 'SFP-MR0'
        if 'id' in json_obj and json_obj['id'] == 'SFR-RP':
            # Try to find the fire propagation gate document
            fire_migrate_to_room = self.fire_propagation_to_room_representation.get(room_id)
            if fire_migrate_to_room:
                # If the document exists, update the 'room_id' field
                fire_migrate_to_room['room_id'] = room_id
                # Append the updated document to the 'inputs' list
                json_obj['inputs'].append(fire_migrate_to_room)
            else:
                warnings.warn(f"Fire propagation gate document not found for room_id: {room_id}", UserWarning)

    def add_ssc_failure_event(self,room_id,json_obj,ssc_document):

        for index, input in enumerate(json_obj['inputs']):
            # print(input
            new_input = input
            if 'id' in input and input['id'] == 'SSC-FF':
                new_input = ssc_document
                new_input['room_id'] = room_id
                json_obj['inputs'][index] = new_input

        return json_obj



    def add_fire_in_or_to_room_gate(self,json_obj,room_id):

        # Check if 'inputs' key exists in json_obj, if not, create it as an empty list
        if 'inputs' not in json_obj:
            json_obj['inputs'] = []

        # Create a new input document to add to the 'inputs' list
        new_input = {}

        # Check if the input has 'id' equal to 'SFP-MR0'
        if 'id' in json_obj and json_obj['id'] == 'SFR-RP':
            # Try to find the fire propagation gate document
            fire_inside_room = self.fire_room_gate_representations.get(room_id)
            if fire_inside_room:
                # If the document exists, update the 'room_id' field
                fire_inside_room['room_id'] = room_id
                # Append the updated document to the 'inputs' list
                json_obj['inputs'].append(fire_inside_room)
            else:
                warnings.warn(f"Fire propagation gate document not found for room_id: {room_id}", UserWarning)






    def fire_room_gate(self):
        # Retrieve the template gate document (assuming it's the only one)
        template_fire_room_gate = self.fire_gate_temp.find_one({})
        if template_fire_room_gate is None:
            raise Exception("Template fire inside a room gate not found.")

        # Use a cursor to iterate over every room document
        cursor = self.rooms_collection.find({})
        #Convert MongoDB document to a JSON object
        for room in cursor:
            # Access the _id and name fields of each room document
            room_id = str(room["_id"])  # Convert ObjectId to string
            room_name = room["name"]

            template_fire_room_gate_json = json.loads(json_util.dumps(template_fire_room_gate))

            # Replace placeholders in the JSON object
            self.replace_placeholders(template_fire_room_gate_json, room_id, room_name)
            # Add HRA events

            self.add_hra_events(template_fire_room_gate_json, room_id)
            print(template_fire_room_gate_json)
            # Add sources of fire events
            self.add_sources_of_fire(template_fire_room_gate_json, self.sources_collection, room_id)

            # Remove ObjectId values from the JSON representation
            gate_json_representation = self.remove_object_ids(template_fire_room_gate_json)

            # Store the gate_json_representation in the dictionary with room_id as the key
            self.fire_room_gate_representations[room_id] = gate_json_representation
    def get_fire_gate_by_room_id(self, room_id):
        # Retrieve the fire room gate_json_representation using room_id
        representation = self.fire_room_gate_representations.get(room_id)
        return representation

    def get_propagation_gate_by_room_id(self, room_id):
        # Retrieve the fire room gate_json_representation using room_id
        representation = self.propagation_from_one_room_representation.get(room_id)
        return representation


    def get_fire_propagation_to_room_gate_by_room_id(self,room_id):

        # Retrieve the fire to room gate_json_representation using room_id
        representation = self.fire_propagation_to_room_representation.get(room_id)
        return representation


    def propagation_to_room(self):

        # Retrieve the propagation to room gate document
        template_fire_propagation_to_room_gate = self.fire_propagation_temp.find_one({"id": "SFRP-MR"})
        if template_fire_propagation_to_room_gate is None:
            raise Exception("Template fire propagation from room gate not found.")

        # Use a cursor to iterate over every room document
        cursor = self.rooms_collection.find({})

        for room in cursor:
            # Access the _id and name fields of each room document
            room_id = str(room["_id"])  # Convert ObjectId to string
            room_name = room["name"]

            # Create a deep copy of the template
            template_copy = copy.deepcopy(template_fire_propagation_to_room_gate)

            # Replace placeholders in the copy with room-specific values
            self.replace_placeholders(template_copy, room_id, room_name)

            source_room_ids = self.get_propagation_events_by_target_room_id(room_id)
            self.source_room_ids_dict[room_id] = source_room_ids


            for source_room_id in source_room_ids:

                # Add fire propagation gate using the copy of the template
                self.add_fire_propagation_gate(template_copy, source_room_id)
            self.remove_object_ids(template_copy)
            self.fire_propagation_to_room_representation[room_id] = template_copy


    def add_fire_propagation_gate(self, json_obj, room_id):
        # Check if 'inputs' key exists in json_obj, if not, create it as an empty list
        if 'inputs' not in json_obj:
            json_obj['inputs'] = []

        # Create a new input document to add to the 'inputs' list
        new_input = {}

        # Check if the input has 'id' equal to 'SFP-MR0'
        if 'id' in json_obj and json_obj['id'] == 'SFRP-MR':
            # Try to find the fire propagation gate document
            propagation_gate_doc = self.propagation_from_one_room_representation.get(room_id)
            if propagation_gate_doc:
                # If the document exists, update the 'room_id' field
                propagation_gate_doc['room_id'] = room_id
                # Append the updated document to the 'inputs' list
                json_obj['inputs'].append(propagation_gate_doc)
            else:
                warnings.warn(f"Flood propagation gate document not found for room_id: {room_id}", UserWarning)

    def propagation_from_one_room_gate(self):
        # Retrieve the propagation from one room gate document
        template_fire_propagation_gate = self.fire_propagation_temp.find_one({"id": "SFRP"})
        if template_fire_propagation_gate is None:
            raise Exception("Template fire propagation gate not found.")

        # Use a cursor to iterate over every room document
        cursor = self.rooms_collection.find({})
        # Convert MongoDB document to a JSON object
        for room in cursor:
            # Access the _id and name fields of each room document
            room_id = str(room["_id"])  # Convert ObjectId to string
            room_name = room["name"]

            template_fire_propagation_gate_json = json.loads(json_util.dumps(template_fire_propagation_gate))
            # Replace placeholders in the JSON object
            self.replace_placeholders(template_fire_propagation_gate_json, room_id, room_name)
            # Add sources of fire gate in the JSON object
            self.add_seismic_fire_room(template_fire_propagation_gate_json,room_id)
            # Add fire barrier collapse gate
            self.add_fire_barrier_collapse(template_fire_propagation_gate_json,room_id,room_name)
            # Store the gate_json_representation in the dictionary with room_id as the key
            self.propagation_from_one_room_representation[room_id] = template_fire_propagation_gate_json

    def add_seismic_fire_room(self,json_obj,room_id):

        for index, input in enumerate(json_obj['inputs']):
            #print(input
            new_input = input
            if 'id' in input and input['id'] == 'SFRR':
                new_input = self.get_fire_gate_by_room_id(room_id)
                new_input['room_id'] = room_id
                json_obj['inputs'][index] = new_input

            for key, value in json_obj.items():
                if key == "id" and value == "SFRR":
                    json_obj[key] = self.get_fire_gate_by_room_id(room_id)
        return json_obj


    def add_fire_barrier_collapse(self, json_obj, room_id,room_num):
        for index, input in enumerate(json_obj['inputs']):
            new_input = input
            # Check if the input has 'id' equal to 'CFB'
            if 'id' in input and input['id'] == 'CTB':
                # Try to find the fire barrier document
                new_input = self.fire_barriers_collection.find_one({"room_id": ObjectId(room_id)},
                                                                      {'room_id': 0, '_id': 0})
                if new_input:
                    # If the document exists, update the 'room_id' field
                    new_input['room_id'] = room_id
                    json_obj['inputs'][index] = new_input
                else:
                    warnings.warn(f"Thermal barrier document not found for room_id: {room_id}", UserWarning)

        for key, value in json_obj.items():
            if key == "id" and value == "CTB":
                # Look for the fire barrier document with the matching room_id
                barrier_doc = self.fire_barriers_collection.find_one({"room_id": ObjectId(room_id)})
                if barrier_doc:
                    json_obj[key] = barrier_doc
                else:
                    warnings.warn(f"Fire barrier document not found for room_id: {room_id}", UserWarning)
        self.replace_placeholders(json_obj,room_id,room_num)
        return json_obj

    def add_hra_events(self, json_obj, room_id, parent=None, parent_key=None):
        hra_document = self.fire_HRA_collection.find_one({"room_id": ObjectId(room_id)}, {'room_id': 0, '_id': 0})

        if hra_document is None:
            raise ValueError(f"No HRA event associated with room_id {room_id}")

        for index, input in enumerate(json_obj['inputs']):
            if 'id' in input and input['id'] == 'Fire_HRA':
                new_input = hra_document.copy()
                new_input['room_id'] = room_id
                json_obj['inputs'][index] = new_input

        for key, value in json_obj.items():
            if key == "id" and value == "Fire_HRA":
                json_obj[key] = hra_document

        return json_obj

    def add_sources_of_fire(self, json_obj, sources_collection, room_id):
        # Fetch SOFR documents from the MongoDB collection
        sofr_documents = list(sources_collection.find({"room_id": ObjectId(room_id)}))

        # Find dictionaries within fire_gate_temp that contain "id": "SOFRR" and update them
        if "inputs" in json_obj:
            for input_obj in json_obj["inputs"]:
                if input_obj.get("id") == "SOFRR":
                    # Assuming input_obj is your JSON document
                    if "inputs" not in input_obj:
                        input_obj["inputs"] = []

                    # Append SOFRR documents from the fetched list
                    input_obj["inputs"].extend(sofr_documents)


        # Return the updated SIR_doc
        return json_obj

    def find_key_value_with_path(self,json_obj, target_key, target_value, path=None):
        if path is None:
            path = []

        found_items = []

        if isinstance(json_obj, dict):
            for key, value in json_obj.items():
                new_path = path + [key]

                if key == target_key and value == target_value:
                    found_items.append((new_path, json_obj))

                if isinstance(value, (dict, list)):
                    found_items.extend(self.find_key_value_with_path(value, target_key, target_value, new_path))

        elif isinstance(json_obj, list):
            for i, item in enumerate(json_obj):
                new_path = path + [i]

                if isinstance(item, (dict, list)):
                    found_items.extend(self.find_key_value_with_path(item, target_key, target_value, new_path))

        return found_items

    def replace_placeholders(self, json_obj, room_id, room_name, ssc_name=None, ssc_description=None):
        if isinstance(json_obj, dict):
            for key, value in json_obj.items():
                if isinstance(value, str):
                    # Replace placeholders with correct values
                    if ssc_name is not None:
                        value = value.replace("[ssc_name]", ssc_name)
                    if ssc_description is not None:
                        value = value.replace("[ssc_description]", ssc_description)
                    value = value.replace("[room_id]", str(room_id)).replace("[room_num]", room_name)
                    json_obj[key] = value
                elif isinstance(value, (dict, list)):
                    self.replace_placeholders(value, room_id, room_name, ssc_name, ssc_description)
        elif isinstance(json_obj, list):
            for item in json_obj:
                self.replace_placeholders(item, room_id, room_name, ssc_name, ssc_description)

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

    def get_propagation_events_by_target_room_id(self, target_room_id):
        # Find the document that contains the target room id
        event_document = self.fire_propagation_events.find_one({"target_room_id": ObjectId(target_room_id)})

        if event_document:
            # Extract the source room IDs from the document
            source_room_ids = [str(src_id) for src_id in event_document.get("source_room_ids", [])]
            return source_room_ids

        # If no matching document is found, return an empty list or raise an exception
        return []

    def remove_oid(self, node_data):
        if isinstance(node_data, dict):
            # Check if the node has a '$oid' key and remove it along with its value
            if '$oid' in node_data:
                del node_data['$oid']

            # Recursively process nested dictionaries and lists
            for key, value in list(node_data.items()):
                node_data[key] = self.remove_oid(value)
        elif isinstance(node_data, list):
            # Recursively process elements in a list
            node_data = [self.remove_oid(item) for item in node_data]

        return node_data

    def remove_id_keys(self, node_data):
        if isinstance(node_data, dict):
            # Check if any key contains the substring '_id' and remove it along with its value
            keys_to_remove = [key for key in node_data.keys() if '_id' in key]
            for key in keys_to_remove:
                del node_data[key]

            # Recursively process nested dictionaries and lists
            for key, value in list(node_data.items()):
                node_data[key] = self.remove_id_keys(value)
        elif isinstance(node_data, list):
            # Recursively process elements in a list
            node_data = [self.remove_id_keys(item) for item in node_data]

        return node_data


# Custom JSON Encoder to handle ObjectId
class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)  # Convert ObjectId to its string representation
        return super(JSONEncoder, self).default(o)

def main():
    mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/'
    fire_db_name = 'seismic_induced_fire_database'
    general_db_name = 'MultiHazards_PRA_General'

    # Usage example
    tree = SeismicFireFaultTree(mongodb_uri, fire_db_name)

    tree.fire_room_gate()  # This method doesn't return anything, so no need to pass it to scan_json_for_id

    tree.propagation_from_one_room_gate()
    tree.propagation_to_room()
    ft = TreeBuilder(mongodb_uri, general_db_name)

    json_fault_trees = [tree.ssc_fault_tree()["CMP-FR-12"], tree.ssc_fault_tree()["CMP-FR-4"]]
    for json_fault_tree in json_fault_trees:
        # Applying the seismic_fire_fault_tree class on seismic-induced fire fault tree json object
        ft.build_tree(json_fault_tree)

        # Print the tree hierarchy with node information
        #ft.print_tree(ft.tree)

        # Visualize the tree
        #ft.visualize_tree()

        ft.write_mard()
if __name__ == "__main__":
    main()
