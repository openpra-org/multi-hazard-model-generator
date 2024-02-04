from pymongo import MongoClient
from src.imports import *

class TsunamiFaultTree:
    def __init__(self, mongodb_uri, general_input_db_name, seismic_flooding_db_name):
        self.client = MongoClient(mongodb_uri)
        self.general_input_db = self.client[general_input_db_name]
        self.seismic_flooding_db = self.client[seismic_flooding_db_name]

        self.general_input = self.general_input_db["General_Input"]
        self.mainshock_ft = self.general_input_db["mainshock_ft"]
        self.tsunami_events_collection = self.seismic_flooding_db["Tsunami_events"]
        self.tsunami_fault_tree_templates = self.seismic_flooding_db["Tsunami_ft_temp"]
        self.mwh_vector = self.general_input['Tsunami']['max_wave_heights']
        self.ms_vector = self.general_input['Mainshock']["MS_vector"]
        # Initialize global variables
        self.room_id = None
        self.ssc_name = None


    def create_tsunami_fault_tree(self,ssc_document):
        self.room_id = str(ssc_document.get("room_id"))
        self.ssc_name = str(ssc_document.get("name"))










    def create_fault_tree_PGA_bin(self, pga_bin):
        # Method to create the Tsunami fault tree given the PGA bin
        pass

    def create_gates_MWH_bin(self,pga_bin_num, mwh_bin_num):  # MWH: maximum wave height
        mwh_gate = copy.deepcopy(self.tsunami_fault_tree_templates.find_one({"id": "TSU-MS-MWH"}))

        # grab house events for mhw_gate
        ms_he = copy.deepcopy(self.tsunami_fault_tree_templates.find_one({"id": "MS-BE"}))
        self.replace_placeholders(ms_he,self.room_id,self.ssc_name,ssc_description=None,mwh_bin_num=None,pga_bin_num=pga_bin_num,pga_bin = self.ms_vector[pga_bin_num-1])
        mwh_he = copy.deepcopy(self.tsunami_fault_tree_templates.find_one({"id": "HE-MWH"}))
        self.replace_placeholders(mwh_he, self.room_id, self.ssc_name, ssc_description=None, mwh_bin_num=mwh_bin_num,pga_bin_num=pga_bin_num,pga_bin = self.ms_vector[pga_bin_num-1])

        # Append the mhw_gate with house events
        mwh_gate["inputs"].append(ms_he)
        mwh_gate["inputs"].append(mwh_he)

        # Calculate probability of mhw given an earthquake PGA bin
        if mwh_bin_num == 1:
            max_wave_height_range= [0,self.mwh_vector[0]]
        else:
            max_wave_height_range=[self.mwh_vector[mwh_bin_num-2],self.mwh_vector[mwh_bin_num-1]]

        pga_bin_value = self.mwh_vector[pga_bin_num-1]
        mwh_probability= self.calculate_mwh_probability(pga_bin_value, max_wave_height_range)

        # Add conditional probability event to the mwh_gate
        mwh_conditional_probability = copy.deepcopy(self.tsunami_fault_tree_templates.find_one({"id": "TSU-CP"}))
        self.tsunami_fault_tree_templates

    def calculate_mwh_probability(self, pga_value, max_wave_height_range):
        # Calculate the mean tsunami height based on the PGA
        alpha = 1
        beta = 1
        std_error= 0.5
        mean_tsunami_height = alpha + beta * (10 * pga_value) ** 1.6

        # Calculate the parameters for the log-normal distribution
        mu_ln = np.log(mean_tsunami_height) - 0.5 * std_error ** 2
        sigma_ln = std_error

        # Create a log-normal distribution for tsunami heights
        tsunami_height_dist = stats.lognorm(scale=np.exp(mu_ln), s=sigma_ln)

        # Calculate the cumulative probability for the specified range of tsunami heights
        lower_bound_prob = tsunami_height_dist.cdf(max_wave_height_range[0])
        upper_bound_prob = tsunami_height_dist.cdf(max_wave_height_range[1])

        # Calculate the probability of the range
        range_probability = upper_bound_prob - lower_bound_prob

        return range_probability

    class TsunamiFaultTree:
        # Your existing code...

        def replace_placeholders(self, json_obj, room_id, ssc_name=None, ssc_description=None, mwh_bin_num=None,
                                 pga_bin_num=None, pga_num=None):
            if isinstance(json_obj, dict):
                for key, value in json_obj.items():
                    if isinstance(value, str):
                        # Replace placeholders with correct values
                        if ssc_name is not None:
                            value = value.replace("[ssc_name]", ssc_name)
                        if ssc_description is not None:
                            value = value.replace("[ssc_description]", ssc_description)
                        value = value.replace("[room_id]", str(room_id))

                        if mwh_bin_num is not None:
                            value = value.replace("[scenario_num]", str(mwh_bin_num))
                        if pga_bin_num is not None:
                            value = value.replace("[pga_num]", str(pga_bin_num))
                        if pga_num is not None:
                            value = value.replace("[pga_num]", str(pga_num))
                        json_obj[key] = value
                    elif isinstance(value, (dict, list)):
                        self.replace_placeholders(value, room_id, ssc_name, ssc_description, mwh_bin_num, pga_bin_num,
                                                  pga_num)
            elif isinstance(json_obj, list):
                for item in json_obj:
                    self.replace_placeholders(item, room_id, ssc_name, ssc_description, mwh_bin_num, pga_bin_num,
                                              pga_num)
