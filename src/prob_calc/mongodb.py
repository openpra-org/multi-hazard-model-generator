import random
from pymongo import MongoClient
# Create a MongoDB client
client = MongoClient('mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/')

# Create or use a database
db = client['seismic_flooding_database']

# Define collections
rooms_collection = db['rooms']
components_collection = db['components']
flooding_sources_collection = db['flooding_sources']
flooding_propagation_collection = db['flooding_propagation']

# List of room names
room_names = ["Room A", "Room B", "Room C", "Room D"]

# Create random rooms
# List of room names
room_names = ["Room A", "Room B", "Room C", "Room D"]

# Create random rooms
# Create random rooms
for room_name in room_names:
    room = {
        "room_name": room_name,
        "building_name": f"Building {random.randint(1, 5)}",
        "floor_number": random.randint(1, 10)
    }
    room_id = rooms_collection.insert_one(room).inserted_id

    # Create random components for each room
    for _ in range(random.randint(1, 5)):
        component = {
            "component_name": f"Component {random.randint(1, 10)}",
            "room_id": room_id,
            "vulnerability_details": "Component details here"
        }
        components_collection.insert_one(component)

    # Create random flooding sources for each room
    for _ in range(random.randint(1, 3)):
        source = {
            "source_name": f"Flooding Source {random.randint(1, 5)}",
            "room_id": room_id,
            "source_details": "Source details here"
        }
        flooding_sources_collection.insert_one(source)

    # Create random flooding propagation events
    for _ in range(random.randint(0, 2)):
        source_rooms = random.sample(room_names, random.randint(1, len(room_names)))
        target_room = random.choice(room_names)
        while target_room in source_rooms:
            target_room = random.choice(room_names)
        source_room_ids = [rooms_collection.find_one({"room_name": source})["_id"] for source in source_rooms if rooms_collection.find_one({"room_name": source}) is not None]
        target_room_id = rooms_collection.find_one({"room_name": target_room})["_id"] if rooms_collection.find_one({"room_name": target_room}) is not None else None
        propagation = {
            "source_rooms": source_rooms,
            "target_room": target_room,
            "source_room_ids": source_room_ids,
            "target_room_id": target_room_id,
            "propagation_details": "Propagation details here"
        }
        flooding_propagation_collection.insert_one(propagation)

# Close the MongoDB connection
client.close()

print("Database populated with fixtures.")
