from imports import *
from  seismic_event import  SeismicEvent
from seismic_fault_tree import SeismicFaultTree


# Get the directory path of the current script (main.py)
current_dir = os.path.dirname(os.path.abspath(__file__))

# Construct the path to the JSON input file
json_filename = "input.json"
json_file_path = os.path.join(current_dir, "..", "inputs", json_filename)
seismic_event_csv_path = os.path.join(current_dir, "..", "inputs", "seismic_events.csv")

# Construct the output directory path
output_dir = os.path.join(current_dir, "..", "output", "general")

seismic_event_info = SeismicEvent.from_input_file(json_file_path)


events=SeismicEvent.from_csv(os.path.join(current_dir, "..", "inputs"),seismic_event_info.input_params["name"])

for event in events:
    print(event)
    event.create_bei_file(output_dir, json_file_path)
    event.create_bed_file(output_dir,json_file_path)



event.aftershock_frequency_event_write(output_dir,json_file_path)
event.create_compound_events(output_dir, json_file_path,seismic_event_csv_path)
event.write_house_event(output_dir,json_file_path)


fault_tree_instance = SeismicFaultTree()

seismic_event_info = fault_tree_instance.from_input_file(json_file_path)
events = fault_tree_instance.from_csv(os.path.join(current_dir, "..", "inputs"), seismic_event_info.input_params["name"])

for event in events:
    event.write_mainshock_fault_tree(output_dir,json_file_path)
    event.write_aftershock_fault_tree(output_dir,json_file_path)

ms_event_names = SeismicEvent.get_events_by_category("MS")
as_event_names = SeismicEvent.get_events_by_category("AS")
as_fq_event_names = SeismicEvent.get_events_by_category("AS_FQ")
ce_event_names = SeismicEvent.get_events_by_category("CE")
he_event_names = SeismicEvent.get_events_by_category("HE_MS")
ms_ft_names = fault_tree_instance.get_fault_by_category("MS")
ms_gt_names = fault_tree_instance.get_gate_by_category("MS")




