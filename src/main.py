from imports import *
from  seismic_event import  SeismicEvent



# The path for the JSON Seismic File
json_file_path = "/Users/akram/Development/multi-hazard-pra-model-generator/inputs/input.json"
output_dir = "/Users/akram/Development/multi-hazard-pra-model-generator/output/general"

seismic_event_info = SeismicEvent.from_input_file(json_file_path)


events=SeismicEvent.from_csv(seismic_event_info.input_params["path"],seismic_event_info.input_params["name"])

for event in events:
    event.create_bed_file(output_dir,json_file_path)
    event.create_bei_file(output_dir, json_file_path)