from bson import json_util, ObjectId
from pymongo import MongoClient
import json

class SeismicFloodingFaultTree:
    def __init__(self, mongodb_uri, db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]
        self.sources_collection = self.db["flood_sources"]
        self.rooms_collection = self.db["rooms"]
        self.barriers_collection = self.db["flood_barriers"]
        self.flooding_gate_temp = self.db["flooding_gate_temp"]
        self.flooding_HRA_collection = self.db["Flooding_HRA"]



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
            self.scan_json_for_id(template_flood_room_gate_json, room_id)
            # Now, template_flood_room_gate_json contains the gate document with placeholders replaced
           #print(json.dumps(template_flood_room_gate_json, indent=4))

    def scan_json_for_id(self, json_obj, room_id, parent=None, parent_key=None):
        for index, input in enumerate(json_obj['inputs']):
            #print(input
            new_input = input
            if 'id' in input and input['id'] == 'Flood_HRA':
                new_input = ((self.flooding_HRA_collection.find_one({"room_id": ObjectId(room_id)}, {'room_id': 0,'_id': 0})))
                new_input['room_id'] = room_id
                json_obj['inputs'][index] = new_input

            #json_obj['input'] = new_input

        print(json_obj)
        return json_obj
        for key, value in json_obj.items():
            if key == "id" and value == "Flood_HRA":
                # Look for the HRA document with the matching room_id
                hra_document = self.flooding_HRA_collection.find_one({"room_id": ObjectId(room_id)})
                json_obj[key] = hra_document

        return json_obj





        return  hra_document

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
def main():
    mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/'
    db_name = 'seismic_flooding_database'
    # Usage example
    tree = SeismicFloodingFaultTree(mongodb_uri, db_name)
    tree.flood_room_gate()  # This method doesn't return anything, so no need to pass it to scan_json_for_id

if __name__ == "__main__":
    main()