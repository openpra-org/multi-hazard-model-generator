from pymongo import MongoClient

class SeismicFloodingFaultTree:
    def __init__(self, mongodb_uri, db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]
        self.sources_collection = self.db["flood_sources"]
        self.rooms_collection = self.db["rooms"]
        self.barriers_collection = self.db["flood_barriers"]
        self.flooding_gate_temp = self.db["flooding_gate_temp"]

        # Check if the flood_HRA collection exists, and create it if it doesn't
        if "Flooding_HRA" not in self.db.list_collection_names():
            self.flood_HRA = None
            print("The Flooding_HRA collection does not exist.")
        else:
            self.flood_HRA = self.db["Flooding_HRA"]

    def flood_room_gate(self):
        # Retrieve the template gate document (assuming it's the only one)
        template_flood_room_gate = self.flooding_gate_temp.find_one({})

        if not template_flood_room_gate:
            print("Template flooding inside a room gate not found.")
            return

        # Use a cursor to iterate over every room document
        cursor = self.rooms_collection.find({})

        for room in cursor:
            # Access the _id and name fields of each room document
            room_id = room["_id"]
            room_name = room["name"]

            # Make a copy of the template gate to avoid modifying the original
            modified_gate = template_flood_room_gate.copy()

            # Replace placeholders with actual values
            modified_gate["description"] = modified_gate["description"].replace("[room_num]", room_name)
            modified_gate["name"] = modified_gate["name"].replace("[room_id]", str(room_id))

            # Check if flood_HRA exists and find the document with room_id
            if self.flood_HRA:
                hra_document = self.flood_HRA.find_one({"room_id": room_id})
                if hra_document:
                    # Append the HRA document to the "inputs" array
                    modified_gate["inputs"].append(hra_document)

            # Now, modified_gate contains the gate document with placeholders replaced
            print(modified_gate)

# Usage example
def main():
    mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/'
    db_name = 'seismic_flooding_database'

    tree = SeismicFloodingFaultTree(mongodb_uri, db_name)
    tree.flood_room_gate()

if __name__ == "__main__":
    main()









