from imports import *
from  seismic_event import  SeismicEvent



# Get the directory path of the current script (main.py)
current_dir = os.path.dirname(os.path.abspath(__file__))

# Construct the path to the JSON input file
json_filename = "input.json"
json_file_path = os.path.join(current_dir, "..", "inputs", json_filename)

# Construct the output directory path
output_dir = os.path.join(current_dir, "..", "output", "general")

seismic_event_info = SeismicEvent.from_input_file(json_file_path)


events=SeismicEvent.from_csv(os.path.join(current_dir, "..", "inputs"),seismic_event_info.input_params["name"])

for event in events:
    event.create_bed_file(output_dir,json_file_path)
    event.create_bei_file(output_dir, json_file_path)