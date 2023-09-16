from pymongo import MongoClient
import json
from bson import ObjectId  # Import ObjectId

# Custom JSON Encoder to handle ObjectId
class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)  # Convert ObjectId to its string representation
        return super(JSONEncoder, self).default(o)

# Create a MongoDB client
client = MongoClient('mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/')

db = client["seismic_flooding_database"]
components_collection = db["components"]
room_collection =db["rooms"]
flood_sources_collection = db["flooding_sources"]
HRA_flood_collection = db["Flooding_HRA"]
# Define your JSON template as a JSON-formatted string
json_template_str = '''{
    "description": "FAILURE OF [ssc_name] DUE TO SEISMIC INDUCED FLOODING",
    "name": "[ssc_name]-SIF-FT", 
    "type": "FT",
    "room" :"[room_name]" , 
    "logic_type": "AND",
    "id": "SFL",
    "inputs": [
      {
        "logic_type": "AND",
        "id": "SFLMR", 
        "type": "GT",
        "description": "FLOODING INSIDE  [main_room_num]",
        "name": "SIF-R-[room_id]-GT", 
        "inputs": [
          {
            "description": "SOURCES OF FLOODING INSIDE [main_room_num]",
            "name": "SIF-SRC-R-[room_id]-GT",
            "id": "SFLMR",  
            "type": "GT",  
            "logic_type": "OR",
            "inputs": [
              {
                "name": "[ssc_flood_name]-SEIS-FT",
                "description": "SEISMIC FAILURE OF  [ssc_flood_name] CAUSING FLOODING",
                "id": "seismic_FT",
                "num": "[num_ssc_flood]",
                "logic_type": "OR"
              }
              
            ]
          }, 
          {
            "logic_type": "BE",
            "name" : "[num_ssc_flood]-HRA", 
            "type": "HRA",
            "description": "FAILURE OF OPERATOR ACTION TO PREVENT FLOODING OF [num_ssc_flood]"
          }
        
        ]
      },
      {
        "description": "FLOODING IN OTHER ROOMS PROPAGATING TO ROOM [main_room_num]",
        "name": "SIF-R-DR-GT", 
        "id": "SFLOR",
        "type": "GT",
        "logic_type": "OR",
        "inputs": [
          {
            "description": "FLOODING PROPAGATING FROM ROOM [diff_room_num] TO ROOM [main_room_num]",
            "name": "SIF-R-[diff_room_num]-PRG-GT", 
            "id": "SFLOR",
            "type": "GT",
            "num": "[tot_room_num]",
            "logic_type": "AND",
            "inputs": [
              {
                "description": "SOURCES OF FLOODING INSIDE ROOM [diff_room_num]",
                "name" : "SIF-SRC-R-[diff_room_num]-GT", 
                "id": "SFLOR",
                "type": "GT",
                "logic_type": "AND",
                "inputs": [
                  {
                    "description": "SEISMIC FAILURE OF [ssc_flood_name]",
                    "name": "[ssc_flood_name]-SEIS-FT",
                    "id": "SFLOR",
                    "type": "seismic_FT",
                    "num_ssc_flood": "[num]",
                    "logic_type": "OR"
                  },
                  {
                    "logic_type": "BE",
                    "name" : "[num_ssc_flood]-HRA", 
                    "type": "HRA",
                    "description": "FAILURE OF OPERATOR ACTION TO PREVENT FLOODING OF [ssc_flood_name]"
                  }
                ]
              }
            ]
          },
          {
            "description": "BARRIERS COLLAPSE",
            "name": "BARR-COLL-[ssc_name]-GT", 
            "id": "SFLOR",
            "type": "GT",
            "logic_type": "AND",
            "inputs": [
              {
                "description": "BARRIERS OF ROOM [main_room_num]",
                "name": "BARR-COLL-R-[main_room_num]-[ssc_name]-GT", 
                "id": "SFLMR",
                "type": "GT",
                "logic_type": "OR",
                "inputs": [
                  {
                    "description": "SEISMIC FAILURE OF [barrier_main]",
                    "name": "[barrier_mr]-SEIS-FT", 
                    "logic_type": "OR",
                    "id": "barrier_mr",
                    "type": "seismic_FT"
                  },
                  {
                    "logic_type": "BE",
                    "name": "[barrier_mr]-PRS-BE", 
                    "type": "pressure",
                    "description": "COLLAPSE OF WATER BARRIER IN ROOM [main_room_num] DUE TO PRESSURE"
                    
                  }
                ]
              },
              {
                "description": "BARRIERS OF ROOM [diff_room_num]",
                "name": "BARR-COLL-R-[diff_room_num]-[ssc_name]-GT", 
                "id": "SFLOR",
                "type": "GT",
                "logic_type": "OR",
                "inputs": [
                  {
                    "description": "SEISMIC FAILURE OF [barrier_other]",
                    "name": "[barrier_or]-SEIS-FT", 
                    "logic_type": "OR",
                    "type": "seismic_FT"
                  },
                  {
                    "logic_type": "BE",
                    "name": "[barrier_mr]-PRS-BE", 
                    "type": "pressure",
                    "description": "COLLAPSE OF WATER BARRIER IN ROOM [diff_room_num] DUE TO PRESSURE"
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  }
'''

# Function to replace placeholders in the JSON template
def replace_placeholders(json_template, data):
    for key, value in data.items():
        json_template = json_template.replace(f"[{key}]", str(value))
    return json_template

# Retrieve component data from MongoDB and apply replacements
# Retrieve component data from MongoDB and apply replacements
for component in components_collection.find():
    component_data = {
        "ssc_name": component["name"],
        "room_id": component["room_id"],  # Keep the ObjectId
        "component_description": component.get("description", ""),
        "component_id": str(component["_id"]),  # Convert ObjectId to string
    }

    # Look up the corresponding room document by room_id
    room = room_collection.find_one({"_id": component_data["room_id"]})
    source = flood_sources_collection.find_one({"room_id": component_data["room_id"]})
    HRA_event = HRA_flood_collection.find_one({"room_id": component_data["room_id"]})
    print(source)
    if room:
        # Extract the room name from the room document
        component_data["room_name"] = room.get("name", "")
        component_data["main_room_num"] = room.get("name", "")
        component_data["ssc_flood_name"] = source.get("name", "")
        component_data["ssc_flood_name"] = source.get("name", "")
    else:
        # Handle the case where no room document was found
        component_data["room_name"] = ""
        component_data["main_room_num"] = ""

    # Apply replacements to the JSON template
    filled_json = replace_placeholders(json_template_str, component_data)

    # Do something with the filled JSON string, like saving it to a file or processing it further
    print(filled_json)
