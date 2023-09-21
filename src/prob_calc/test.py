from pymongo import MongoClient
from bson.objectid import ObjectId
import copy

# Connect to your MongoDB server
mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/'
client = MongoClient(mongodb_uri)
db = client['seismic_flooding_database']
collection = db.get_collection("flooding_gate_temp")
sources_collection = db.get_collection("flood_sources")

# Fetch SOFR documents from the MongoDB collection
sofr_documents = list(sources_collection.find({"room_id": ObjectId("65026bcc7358e5227605e791")}))

# Find documents that contain "id": "SOFR" and update local copies
cursor = collection.find({"inputs": {"$elemMatch": {"id": "SOFR"}}})
for doc in cursor:
    # Iterate through the "inputs" array and find the dictionary with "id": "SOFR"
    for input_obj in doc["inputs"]:
        if input_obj.get("id") == "SOFR":
            # Assuming input_obj is your JSON document
            if "inputs" not in input_obj:
                input_obj["inputs"] = []

            # Append SOFR documents from the fetched list
            input_obj["inputs"].extend(sofr_documents)

    # Now you can work with the modified local copy without affecting the original document
    print("Modified Local Copy:")
    print(doc)

# Close the MongoDB connection
client.close()
