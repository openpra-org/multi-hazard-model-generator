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

# Define buildings and floors
buildings = ["Building A"]
floors = [1, 2, 3]

# List of common room names
common_room_names = ["Room A", "Room B", "Room C", "Room D", "Room E", "Room F", "Room G", "Room H"]

# Create random rooms
for building in buildings:
    for floor_number in floors:
        # Create unique room names for each floor based on the common room names
        floor_room_names = [f"{common_name} - Floor {floor_number}" for common_name in common_room_names]

        for room_name in floor_room_names:
            room = {
                "room_name": room_name,
                "building_name": building,
                "floor_number": floor_number,
                "flood_barrier": {
                    "seismic_fragility": {
                        "distribution_type": "L",  # Lognormal distribution
                        "median_seismic_acceleration": random.uniform(0.1, 2.0),
                        "beta_r_uncertainty": random.uniform(0.01, 0.5),
                        "beta_u_uncertainty": random.uniform(0.01, 0.5)
                    },
                    "pressure_fragility": {
                        "distribution_type": "F",  # Flooding distribution
                        "median_flood_depth": random.uniform(1, 10),
                        "beta_r_uncertainty": random.uniform(0.1, 2.0),
                        "beta_u_uncertainty": random.uniform(0.1, 2.0)
                    }
                }
            }
            room_id = rooms_collection.insert_one(room).inserted_id

            # Create random components for each room
            for _ in range(random.randint(1, 5)):
                component = {
                    "component_name": f"Component {random.randint(1, 10)}",
                    "room_id": room_id,
                    "vulnerability_details": {
                        "fragility_model": [
                            "L",  # Distribution type (Lognormal)
                            random.uniform(0.1, 2.0),  # Median seismic acceleration (Am)
                            random.uniform(0.01, 0.5),  # Beta_r uncertainty
                            random.uniform(0.01, 0.5)   # Beta_u uncertainty
                        ]
                    }
                }
                components_collection.insert_one(component)

            # Create random flooding sources for each room
            for _ in range(random.randint(1, 3)):
                source = {
                    "source_name": f"Flooding Source {random.randint(1, 5)}",
                    "room_id": room_id,
                    "source_details": {
                        "fragility_model": [
                            "F",  # Distribution type (Flooding lognormal)
                            random.uniform(1, 5),  # Median flood depth (D)
                            random.uniform(0.1, 2.0),  # Beta_r uncertainty
                            random.uniform(0.1, 2.0)   # Beta_u uncertainty
                        ]
                    }
                }
                flooding_sources_collection.insert_one(source)

            # Create random flooding propagation events
            for _ in range(random.randint(0, 2)):
                source_rooms = random.sample(floor_room_names, random.randint(1, len(floor_room_names)))
                target_room = random.choice(floor_room_names)
                while target_room in source_rooms:
                    target_room = random.choice(floor_room_names)

                source_room_ids = []
                for source in source_rooms:
                    source_room_document = rooms_collection.find_one({"room_name": source})
                    if source_room_document:
                        source_room_ids.append(source_room_document["_id"])
                    else:
                        print(f"Warning: Room '{source}' not found in the database.")
                        continue

                target_room_document = rooms_collection.find_one({"room_name": target_room})
                if target_room_document:
                    target_room_id = target_room_document["_id"]
                else:
                    print(f"Warning: Room '{target_room}' not found in the database.")
                    continue

                propagation = {
                    "source_rooms": source_rooms,
                    "target_room": target_room,
                    "source_room_ids": source_room_ids,
                    "target_room_id": target_room_id
                }
                flooding_propagation_collection.insert_one(propagation)

# Close the MongoDB connection
client.close()

print("Database populated with fixtures.")
