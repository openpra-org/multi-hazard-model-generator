import copy

from src.mainshock_aftershocks.tree_builder import TreeBuilder
from src.imports import *
from src.mainshock_aftershocks.seismic import SeismicEvent

class SeismicFireFaultTree:
    def __init__(self, mongodb_uri, db_name,seismic_event_instance):
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
        self.thermal_barrier_collapse_ft_dict = {}   # Dictionary to store thermal barrier fault trees
        self.barrier_house_event_dict = {}  # Dictionary to store barrier failure house events
        self.combination_of_fire_inside_propagation_dict = {}

        self.ssc_ft_representation = {}
        self.seismic_event_instance = seismic_event_instance


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
            #self.add_combined_fire_inside_propagate_to_ssc_ft(ssc_fault_tree_copy, fire_in_or_to_room_gate_copy)
            #print(ssc_fault_tree_copy)
            self.remove_object_ids(ssc_fault_tree_copy)
            self.remove_oid(ssc_fault_tree_copy)
            self.remove_id_keys(ssc_fault_tree_copy)
            # Store the result in the ssc_ft_representation dictionary
            self.ssc_ft_representation[ssc_name] = ssc_fault_tree_copy
            print(ssc_fault_tree_copy)

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
        template_fire_room_gate = self.fire_gate_temp.find_one({"id":"SFRR"})
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

            self.add_hra_events(template_fire_room_gate_json, room_id,room_name)
            # Add sources of fire events
            self.add_sources_of_fire(template_fire_room_gate_json, room_id,room_name)
            fire_sprinkler_failure_gate=self.create_fire_sprinkler_failure_gate(room_id,room_name)
            template_fire_room_gate_json["inputs"].append(fire_sprinkler_failure_gate)
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
            #self.add_fire_barrier_collapse(template_fire_propagation_gate_json,room_id,room_name)
            # Add thermal barrier house events
            thermal_barrier_house_event =self.create_barrier_house_event(room_id,room_name)
            template_fire_propagation_gate_json["inputs"].append(thermal_barrier_house_event)
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


    def add_fire_barrier_collapse(self,json_obj, room_id,room_num):

        # Fetch thermal barrier collapse gate
        thermal_barrier_collapse_gate = copy.deepcopy(self.fire_barriers_collection.find_one({"id":"CTB-FT"}))

        # Add barrier seismic and fire collapse fault tree and event to the barrier collapse gate
        # Adding thermal barrier collapse due to fire
        thermal_barrier_collapse_gate["inputs"].append(
            self.fire_barriers_collection.find_one(
                {"room_id": ObjectId(room_id), "type": "FIR_LN"},
                {'room_id': 0, '_id': 0}
            )
        )

        # Adding thermal barrier collapse due to seismic event


        # Find the fire barrier document based on room_id and type
        fire_barrier_query = {"room_id": ObjectId(room_id), "type": "SBE"}
        fire_barrier_document = self.remove_object_ids(self.fire_barriers_collection.find_one(fire_barrier_query))
        thermal_barrier_collapse_seismic_fault_tree = self.seismic_event_instance.create_seismic_fault_tree(
            fire_barrier_document)
        self.replace_placeholders(thermal_barrier_collapse_seismic_fault_tree,room_id,room_num,ssc_name=fire_barrier_document["name"],ssc_description= fire_barrier_document["description"])


        # Append the fire barrier document to thermal_barrier_collapse_gate["inputs"]
        thermal_barrier_collapse_gate["inputs"].append(thermal_barrier_collapse_seismic_fault_tree)
        # Create the seismic fault tree using the updated inputs
        self.replace_placeholders(thermal_barrier_collapse_gate,room_id,room_num)
        json_obj["inputs"].append(thermal_barrier_collapse_gate)
        return json_obj

    def create_barrier_house_event(self, room_id, room_num):
        # Check if the room_id is already in the dictionary
        if room_id in self.barrier_house_event_dict:
            return self.barrier_house_event_dict[room_id]

        # Fetch barrier house event template
        barrier_house_event_temp = copy.deepcopy(self.fire_barriers_collection.find_one({"id": "HE-FR-BAR"}))

        # Replace placeholders and update the dictionary
        self.replace_placeholders(barrier_house_event_temp, room_id, room_num)
        self.barrier_house_event_dict[room_id] = barrier_house_event_temp

        return barrier_house_event_temp

    def create_fire_barrier_collapse_ft(self, room_id, room_num):
        # Check if the room_id is already in the dictionary
        if room_id in self.thermal_barrier_collapse_ft_dict:
            return self.thermal_barrier_collapse_ft_dict[room_id]

        # Fetch thermal barrier collapse gate
        thermal_barrier_collapse_ft = copy.deepcopy(self.fire_barriers_collection.find_one({"id": "CTB-FT"}))

        # Add barrier seismic and fire collapse fault tree and event to the barrier collapse gate
        # Adding thermal barrier collapse due to fire
        thermal_barrier_collapse_ft["inputs"].append(
            self.fire_barriers_collection.find_one(
                {"room_id": ObjectId(room_id), "type": "FIR_LN"},
                {'room_id': 0, '_id': 0}
            )
        )

        # Adding thermal barrier collapse due to seismic event

        # Find the fire barrier document based on room_id and type
        fire_barrier_query = {"room_id": ObjectId(room_id), "type": "SBE"}
        fire_barrier_document = self.remove_object_ids(self.fire_barriers_collection.find_one(fire_barrier_query))
        thermal_barrier_collapse_seismic_fault_tree = self.seismic_event_instance.create_seismic_fault_tree(
            fire_barrier_document)
        self.replace_placeholders(thermal_barrier_collapse_seismic_fault_tree, room_id, room_num,
                                  ssc_name=fire_barrier_document["name"],
                                  ssc_description=fire_barrier_document["description"])

        # Append the fire barrier document to thermal_barrier_collapse_gate["inputs"]
        thermal_barrier_collapse_ft["inputs"].append(thermal_barrier_collapse_seismic_fault_tree)

        # Create the seismic fault tree using the updated inputs
        self.replace_placeholders(thermal_barrier_collapse_ft, room_id, room_num)

        # Store the thermal_barrier_collapse_gate in the global dictionary
        self.thermal_barrier_collapse_ft_dict[room_id] = thermal_barrier_collapse_ft

        return thermal_barrier_collapse_ft

    def add_hra_events(self, json_obj, room_id,room_name,parent=None, parent_key=None):
        hra_document = self.fire_HRA_collection.find_one({"room_id": ObjectId(room_id)}, {'room_id': 0, '_id': 0})
        self.replace_placeholders(hra_document,room_id,room_name)
        if hra_document is None:
            raise ValueError(f"No HRA event associated with room_id {room_id}")

        json_obj["inputs"].append(hra_document)


        return json_obj

    def add_sources_of_fire(self, json_obj, room_id,room_name):
        # Fetch the SOFR gate from the MongoDB collection
        sofr_gate= copy.deepcopy(self.fire_gate_temp.find_one({"id":"SOFRR"}))
        self.replace_placeholders(sofr_gate,room_id,room_name)

        # Fetch SOFR documents from the MongoDB collection
        sofr_seismic_documents = list(self.sources_collection.find({"room_id": ObjectId(room_id), "type": "SBE"}))

        for sofr_seismic_document in sofr_seismic_documents:
            ssc_id = sofr_seismic_document.get("ssc_id")
            if ssc_id:
                # Find documents in sources_collection with the same ssc_id and type "FIR-RAND"
                fir_rand_documents = list(self.sources_collection.find({"ssc_id": ssc_id, "type": "FIR-RAND"}))

                # Process fir_rand_documents as needed, e.g., add them to sofr_gate["inputs"]
                print(sofr_seismic_document)
                sofr_document_seismic_fault_tree = self.seismic_event_instance.create_seismic_fault_tree(
                    sofr_seismic_document)

                self.replace_placeholders(sofr_document_seismic_fault_tree, room_id, room_name,
                                          sofr_seismic_document["name"], sofr_seismic_document["description"])

                # Append sofr_document_seismic_fault_tree to sofr_gate["inputs"]
                sofr_gate["inputs"].append(sofr_document_seismic_fault_tree)

                # Append fir_rand_documents to sofr_gate
                for fir_rand_document in fir_rand_documents:

                    self.replace_placeholders(fir_rand_document, room_id, room_name, fir_rand_document["name"],
                                              fir_rand_document["description"])
                    sofr_gate["inputs"].append(fir_rand_document)

        # Append sofr_gate to json_obj["inputs"]
        json_obj["inputs"].append(sofr_gate)
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

    def create_fire_sprinkler_failure_gate(self, room_id,room_num):
        # Look for the fire sprinkler gate
        fire_sprinkler_failure_gate = copy.deepcopy(self.fire_sprinkler_collection.find_one({"id": "SPR"}))

        # Create the seismic fault tree for fire sprinkler seismic failure
        fire_sprinkler_seismic_event = copy.deepcopy(self.fire_sprinkler_collection.find_one({"type": "SBE", "room_id": ObjectId(room_id)})

        )
        ssc_description = fire_sprinkler_seismic_event["description"]
        ssc_name= fire_sprinkler_seismic_event["name"]
        seismic_fault_tree_fire_sprinkler = self.seismic_event_instance.create_seismic_fault_tree(fire_sprinkler_seismic_event)

        # Append the seismic fault tree to the  fire sprinkler gate
        fire_sprinkler_failure_gate["inputs"].append(seismic_fault_tree_fire_sprinkler)

        # Add Failure of sprinkler activation events
        fire_sprinkler_failure_gate["inputs"].append(copy.deepcopy(self.fire_sprinkler_collection.find_one({"type": "FIR_SPR_RAND"})))
        fire_sprinkler_failure_gate["inputs"].append(copy.deepcopy(self.fire_sprinkler_collection.find_one({"type": "FIR-DET"})))

        self.replace_placeholders(fire_sprinkler_failure_gate,room_id,room_num,ssc_name,ssc_description)
        self.remove_object_ids(fire_sprinkler_failure_gate)
        return fire_sprinkler_failure_gate








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
    seismic_event_instance = SeismicEvent(mongodb_uri, general_db_name) #

    # Usage example
    tree = SeismicFireFaultTree(mongodb_uri, fire_db_name,seismic_event_instance)

    tree.fire_room_gate()  # This method doesn't return anything, so no need to pass it to scan_json_for_id

    tree.propagation_from_one_room_gate()
    tree.propagation_to_room()
    ft = TreeBuilder(mongodb_uri, general_db_name)


    json_fault_trees = [tree.ssc_fault_tree()["CMP-FR-12"]]
    for json_fault_tree in json_fault_trees:
        # Applying the seismic_fire_fault_tree class on seismic-induced fire fault tree json object
        ft.build_tree(json_fault_tree)
        print(json_fault_tree)
        # Print the tree hierarchy with node information
        current_dir = os.path.dirname(os.path.abspath(__file__))
        ft.write_mard("seismic_induced_fire", current_dir)
if __name__ == "__main__":
    main()
