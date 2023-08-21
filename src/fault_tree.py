from imports import *
from base_fault import BaseFaultTree
from seismic_event import SeismicEvent

class FaultTree(BaseFaultTree):
    def write_mainshock_fault_tree(self, output_directory, event_names,Json_input):

        file_path = os.path.join(output_directory, "fault_tree.ftl")  # FTL file path

        ms_event_names = SeismicEvent.get_events_by_category("MS")
        ms_he_names  = SeismicEvent.get_events_by_category("HE_MS")









    @classmethod
    def from_input_file(cls, input_file_path):

        with open(input_file_path) as file:
            data = json.load(file)

        aftershocks_params = data["Aftershocks"]
        mainshock_params = data["Mainshock"]
        input_params = data["Input"]
        output_params = data["Output"]
        # # Access individual parameter values for aftershocks
        # consider_aftershocks = aftershocks_params["consider_aftershocks"]
        # num_aftershock_intervals = aftershocks_params["num"]
        # mission_time = aftershocks_params["mission"]
        # n_dt = aftershocks_params["n_dt"]
        # af_vector = aftershocks_params["vector"]
        #
        # # Access individual parameter values for mainshock
        # num_mainshock_intervals = mainshock_params["num"]
        # ms_vector = mainshock_params["MS_vector"]
        # correlation = mainshock_params["correlation"]
        seismic_event_info = cls()
        seismic_event_info.aftershocks_params = aftershocks_params
        seismic_event_info.mainshock_params = mainshock_params
        seismic_event_info.input_params = input_params
        seismic_event_info.output_params = output_params
        return seismic_event_info



