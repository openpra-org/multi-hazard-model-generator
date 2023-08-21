from imports import *
from base_fault import BaseFaultTree
from seismic_event import SeismicEvent

class FaultTree(BaseFaultTree):
    gate_name_categories = {}  # Define the class-level attribute
    fault_name_categories = {}
    def write_mainshock_fault_tree(self, output_directory,Json_input,ms_event_names,he_ms_names):

        # Extracting information from JSON file
        seismic_event_info = self.from_input_file(Json_input)
        mainshock_params = seismic_event_info.mainshock_params
        num_mainshock_intervals = mainshock_params["num"]
        project_name = seismic_event_info.analysis_params["project"]

        # Fault Tree logic file (FTL)
        file_path = os.path.join(output_directory, "fault_tree.ftl")  # FTL file path





        reshaped_event_names = np.reshape(ms_event_names, (-1, num_mainshock_intervals))

        with open(file_path, 'w') as file:
            for row in reshaped_event_names:

                name_split = row[0].split("-")[:-1]
                # Modify each element in name_split using a list comprehension
                modified_name_split = [re.sub(r'[^a-zA-Z0-9-]', '', part) for part in name_split]

                # Join the modified elements back together with "-"
                combined_name = "-".join(modified_name_split)

                ms_ft_name = f"{project_name} ,   {combined_name}-FT = "
                file.write(ms_ft_name + '\n')


                ms_ft_name = f"{combined_name}-FT              OR "
                file.write(ms_ft_name)
                for event_name in row:
                    # Add "GT" prefix to the event name and write it to the file
                    gt_name = f"{event_name}-GT  "
                    self.collect_gate_name("MS",gt_name)
                    file.write(gt_name)
                file.write('\n')

                for index ,event_name in enumerate(row):
                    gt_comp = f"{event_name}-GT                  AND  "
                    file.write(gt_comp)
                    file.write(f"{he_ms_names[index]} {event_name}\n")
                file.write("^EOS\n")



        # Write fault tree description file


    @classmethod
    def collect_gate_name(cls, category, gate_name):
        if category not in cls.gate_name_categories:
            cls.gate_name_categories[category] = []
        cls.gate_name_categories[category].append(gate_name)

    @classmethod
    def collect_fault_tree_name(cls, category, fault_tree_name):
        if category not in cls.fault_name_categories:
            cls.fault_name_categories[category] = []
        cls.fault_name_categories[category].append(fault_tree_name)















    @classmethod
    def from_input_file(cls, input_file_path):

        with open(input_file_path) as file:
            data = json.load(file)

        aftershocks_params = data["Aftershocks"]
        mainshock_params = data["Mainshock"]
        input_params = data["Input"]
        output_params = data["Output"]
        analysis = data["Analysis"]

        seismic_event_info = cls()
        seismic_event_info.aftershocks_params = aftershocks_params
        seismic_event_info.mainshock_params = mainshock_params
        seismic_event_info.input_params = input_params
        seismic_event_info.output_params = output_params
        seismic_event_info.analysis_params = analysis
        return seismic_event_info



