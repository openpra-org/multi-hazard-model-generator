from pymongo import MongoClient
import json
from bson import ObjectId  # Import ObjectId


class SeismicFloodingFaultTree:
    def __init__(self, mongodb_uri, db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]
        self.sources_collection = self.db["flood_sources"]
        self.rooms_collection = self.db["rooms"]

    def add_sources_of_flooding_gate(self, room_id, gate):
        room = self.rooms_collection.find_one({"_id": room_id})
        if room:
            room_name = room.get("name", "")
            gate_id = f"SIF-SRC-R-{room_id}-GT"
            gate["description"] = f"SOURCES OF FLOODING INSIDE {room_name}"
            gate["name"] = gate_id
            gate["id"] = "SFR"
            gate["type"] = "GT"
            gate["logic_type"] = "OR"
            gate["inputs"] = []

            sources = self.sources_collection.find({"room_id": room_id})
            for source in sources:
                # Append the source document as an input
                gate["inputs"].append(source)

        return gate

    def generate_sources_gate_json(self, room_id):
        gate = {
            "description": "",
            "name": "",
            "id": "",
            "type": "",
            "logic_type": "",
            "inputs": []
        }

        sources_gate = self.add_sources_of_flooding_gate(room_id, gate)

        # Convert ObjectId to string representation before serializing to JSON
        def convert_object_ids(obj):
            if isinstance(obj, ObjectId):
                return str(obj)
            elif isinstance(obj, list):
                return [convert_object_ids(item) for item in obj]
            elif isinstance(obj, dict):
                return {key: convert_object_ids(value) for key, value in obj.items()}
            return obj

        # Serialize the gate dictionary to JSON
        json_sources_gate = json.dumps(convert_object_ids(sources_gate), indent=4)

        return json_sources_gate


# Usage example
mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/'
db_name = 'seismic_flooding_database'

tree = SeismicFloodingFaultTree(mongodb_uri, db_name)
room_id = ObjectId("65026bcc7358e5227605e791")  # Replace with the actual room_id
json_sources_gate = tree.generate_sources_gate_json(room_id)
print(json_sources_gate)


