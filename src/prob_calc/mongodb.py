from bson import json_util, ObjectId
from pymongo import MongoClient
import json
import copy
import warnings


class SeismicFloodingFaultTree:
    def __init__(self, mongodb_uri, db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]
        self.sources_collection = self.db["flood_sources"]
        self.rooms_collection = self.db["rooms"]
        self.barriers_collection = self.db["flood_barriers"]
        self.flooding_gate_temp = self.db["flooding_gate_temp"]
        self.flooding_HRA_collection = self.db["Flooding_HRA"]
        self.flood_room_gate_representations = {} # Dictionary to store flood room gate_json_representation by room_id
        self.flooding_propagation_temp =self.db["propagation_gate_temp"]
        self.flood_barriers_collection = self.db["flood_barriers"]
    def flood_room_gate(self):
        # Retrieve the template gate document (assuming it's the only one)
        template_flood_room_gate = self.flooding_gate_temp.find_one({})
        if template_flood_room_gate is None:
            raise Exception("Template flooding inside a room gate not found.")

        # Use a cursor to iterate over every room document
        cursor = self.rooms_collection.find({})
        #Convert MongoDB document to a JSON object
        for room in cursor:
            # Access the _id and name fields of each room document
            room_id = str(room["_id"])  # Convert ObjectId to string
            room_name = room["name"]

            template_flood_room_gate_json = json.loads(json_util.dumps(template_flood_room_gate))

            # Replace placeholders in the JSON object
            self.replace_placeholders(template_flood_room_gate_json, room_id, room_name)
            # Add HRA events
            self.add_hra_events(template_flood_room_gate_json, room_id)
            # Add sources of flooding events
            self.add_sources_of_flooding(template_flood_room_gate_json, self.sources_collection, room_id)

            # Remove ObjectId values from the JSON representation
            gate_json_representation = self.remove_object_ids(template_flood_room_gate_json)

            # Store the gate_json_representation in the dictionary with room_id as the key
            self.flood_room_gate_representations[room_id] = gate_json_representation
    def get_flood_room_gate_by_room_id(self, room_id):
        # Retrieve the flood room gate_json_representation using room_id
        representation = self.flood_room_gate_representations.get(room_id)
        return representation


    def propagation_gate(self):
        # Retrieve the template gate document (assuming it's the only one)
        template_flood_propagation_gate = self.flooding_propagation_temp.find_one({})
        if template_flood_propagation_gate is None:
            raise Exception("Template flooding propagation gate not found.")

        # Use a cursor to iterate over every room document
        cursor = self.rooms_collection.find({})
        # Convert MongoDB document to a JSON object
        for room in cursor:
            # Access the _id and name fields of each room document
            room_id = str(room["_id"])  # Convert ObjectId to string
            room_name = room["name"]

            template_flood_propagation_gate_json = json.loads(json_util.dumps(template_flood_propagation_gate))
            # Replace placeholders in the JSON object
            self.replace_placeholders(template_flood_propagation_gate_json, room_id, room_name)
            # Add sources of flooding gate in the JSON object
            self.add_seismic_flooding_room(template_flood_propagation_gate_json,room_id)
            # Add flood barrier collapse gate
            self.add_flood_barrier_collapse(template_flood_propagation_gate_json,room_id)

            print(template_flood_propagation_gate_json)
    def add_seismic_flooding_room(self,json_obj,room_id):

        for index, input in enumerate(json_obj['inputs']):
            #print(input
            new_input = input
            if 'id' in input and input['id'] == 'SFR':
                new_input = self.get_flood_room_gate_by_room_id(room_id)
                new_input['room_id'] = room_id
                json_obj['inputs'][index] = new_input

            for key, value in json_obj.items():
                if key == "id" and value == "SFR":
                    json_obj[key] = self.get_flood_room_gate_by_room_id(room_id)
        return json_obj

    import warnings

    def add_flood_barrier_collapse(self, json_obj, room_id):
        for index, input in enumerate(json_obj['inputs']):
            # Check if the input has 'id' equal to 'CFB'
            if 'id' in input and input['id'] == 'CFB':
                # Try to find the flood barrier document
                barrier_doc = self.flood_barriers_collection.find_one({"room_id": ObjectId(room_id)},
                                                                      {'room_id': 0, '_id': 0})
                if barrier_doc:
                    # If the document exists, update the 'room_id' field
                    input['room_id'] = room_id
                    json_obj['inputs'][index] = input
                else:
                    warnings.warn(f"Flood barrier document not found for room_id: {room_id}", UserWarning)

        for key, value in json_obj.items():
            if key == "id" and value == "CFB":
                # Look for the flood barrier document with the matching room_id
                barrier_doc = self.flood_barriers_collection.find_one({"room_id": ObjectId(room_id)})
                if barrier_doc:
                    json_obj[key] = barrier_doc
                else:
                    warnings.warn(f"Flood barrier document not found for room_id: {room_id}", UserWarning)

        return json_obj

    def add_hra_events(self, json_obj, room_id, parent=None, parent_key=None):
        for index, input in enumerate(json_obj['inputs']):
            #print(input
            new_input = input
            if 'id' in input and input['id'] == 'Flood_HRA':
                new_input = ((self.flooding_HRA_collection.find_one({"room_id": ObjectId(room_id)}, {'room_id': 0,'_id': 0})))
                new_input['room_id'] = room_id
                json_obj['inputs'][index] = new_input



        for key, value in json_obj.items():
            if key == "id" and value == "Flood_HRA":
                # Look for the HRA document with the matching room_id
                hra_document = self.flooding_HRA_collection.find_one({"room_id": ObjectId(room_id)})
                json_obj[key] = hra_document
        return json_obj

    def add_sources_of_flooding(self, json_obj, sources_collection, room_id):
        # Fetch SOFR documents from the MongoDB collection
        sofr_documents = list(sources_collection.find({"room_id": ObjectId(room_id)}))

        # Find dictionaries within SFR_doc that contain "id": "SOFR" and update them
        if "inputs" in json_obj:
            for input_obj in json_obj["inputs"]:
                if input_obj.get("id") == "SOFR":
                    # Assuming input_obj is your JSON document
                    if "inputs" not in input_obj:
                        input_obj["inputs"] = []

                    # Append SOFR documents from the fetched list
                    input_obj["inputs"].extend(sofr_documents)

        # Print the updated SFR_doc

        # Return the updated SFR_doc if needed
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

    def replace_placeholders(self, json_obj, room_id, room_name):
        if isinstance(json_obj, dict):
            for key, value in json_obj.items():
                if isinstance(value, str):
                    # Replace placeholders with correct values
                    json_obj[key] = value.replace("[room_id]", str(room_id)).replace("[room_num]", room_name)
                elif isinstance(value, (dict, list)):
                    self.replace_placeholders(value, room_id, room_name)
        elif isinstance(json_obj, list):
            for item in json_obj:
                self.replace_placeholders(item, room_id, room_name)

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
    mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/'
    db_name = 'seismic_flooding_database'
    # Usage example
    tree = SeismicFloodingFaultTree(mongodb_uri, db_name)
    tree.flood_room_gate()  # This method doesn't return anything, so no need to pass it to scan_json_for_id
    tree.propagation_gate()
if __name__ == "__main__":
    main()