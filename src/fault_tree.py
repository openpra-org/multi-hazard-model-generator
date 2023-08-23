from imports import *
from base_fault import BaseFaultTree
from seismic_event import SeismicEvent

class SeismicFaultTree(BaseFaultTree):

    def __init__(self, event_description="", phase_type="", probability_parameters=None,
                 event_name="", project_name="", analysis_type="", Lambda=0, tau=0, prob=0,
                 mission=0, UdC="", FdT=0, UdValue=0, UdValue2=0, init=0, PF=0, Freq=0, Tau = 0,
                 beta_u=0, beta_r=0, a_m=0, building="", floor=0, elevation=0, area="",
                 count=0, seismic_fire="", seismic_flooding="", peak_ground_accel=0,start_time= 0, end_time =24):
        super().__init__(event_description, phase_type, probability_parameters,
                         event_name, project_name, analysis_type, Lambda, tau, prob,
                         mission, UdC, FdT, UdValue, UdValue2, init, PF, Freq,Tau ,beta_u,
                         beta_r, a_m, building, floor, elevation, area, count,
                         seismic_fire, seismic_flooding, peak_ground_accel,start_time,end_time)
        self.aftershocks_params = None
        self.mainshock_params = None
        self.frequency_event_processed = False  # Flag to track if frequency event has been processed
    gate_name_categories = {}  # Define the class-level attribute
    fault_name_categories = {}

    def write_mainshock_fault_tree(self,output_directory,json_input):
        # Extracting information from JSON file
        seismic_event_info = self.from_input_file(json_input)
        mainshock_params = seismic_event_info.mainshock_params
        num_mainshock_intervals = mainshock_params["num"]
        project_name = seismic_event_info.analysis_params["project"]
        correlation = mainshock_params["correlation"]

        # Fault Tree logic file (FTL)
        file_path_ftl = os.path.join(output_directory, "fault_tree.FTL")  # FTL file path
        file_path_ftd = os.path.join(output_directory, "fault_tree.FTD")  # FTD file path
        file_path_gtd = os.path.join(output_directory, "fault_tree.GTD")  # FTD file path

        if correlation == "Yes":
            ftl_content = ""
            ftd_content = ""
            gtd_content = ""

            with open(file_path_ftl, 'a') as file_ftl, open(file_path_ftd, 'a') as file_ftd, open(file_path_gtd,
                                                                                                    'a') as file_gtd:

                if not file_ftd.tell():  # Check if the file is empty
                    file_ftd.write(f"{self.project_name}  =\n")

                if not file_gtd.tell():  # Check if the file is empty
                    file_gtd.write(f"{self.project_name}  =\n")


                ssc_name = self.event_name
                ft_name= ssc_name+"-MS-FT"

                #ft_name = ssc_name.join("-MS-FT")
                file_ftl.write(f"{self.project_name},{ft_name} = \n")
                ftd_content += f"{ft_name}, {self.event_description} MAINSHOCK  FAILURE    , S,  , {self.project_name} \n"

                file_ftl.write(f"{ft_name}            OR  ")
                for ms_bin in range(num_mainshock_intervals):
                    gt_name = ssc_name+ f"-MS-{ms_bin+1}-GT  "
                    gtd_content+= f"{gt_name}, {self.event_description} MAINSHOCK BIN {ms_bin+1}, {self.project_name} \n"
                    ftl_content += f"{ssc_name}-MS-{ms_bin+1}-GT            AND  HE-MS-{ms_bin+1}   {ssc_name}-MS-{ms_bin+1}  \n"
                    file_ftl.write(gt_name)
                file_ftl.write("\n")
                ftl_content += "^EOS\n"
                file_ftl.write(ftl_content)
                file_gtd.write(gtd_content)
                file_ftd.write(ftd_content)
        else:

            for event_count in range(1, self.count + 1):
                event_count_str = "" if self.count == 1 else f"-{chr(64 + event_count)}"
                ftl_content = ""
                ftd_content = ""
                gtd_content = ""

                with open(file_path_ftl, 'a') as file_ftl, open(file_path_ftd, 'a') as file_ftd, open(file_path_gtd,
                                                                                                        'a') as file_gtd:

                    if not file_ftd.tell():  # Check if the file is empty
                        file_ftd.write(f"{self.project_name}  =\n")

                    if not file_gtd.tell():  # Check if the file is empty
                        file_gtd.write(f"{self.project_name}  =\n")

                    ssc_name = self.event_name
                    ft_name = ssc_name+  f"{event_count_str}-MS-FT"
                    ftd_content += f"{ft_name}, {self.event_description} TRAIN{event_count_str} MAINSHOCK  FAILURE    , S,  , {self.project_name} \n"

                    # ft_name = ssc_name.join("-MS-FT")
                    file_ftl.write(f"{self.project_name},   {ft_name} = \n")

                    file_ftl.write(f"{ft_name}            OR  ")
                    for ms_bin in range(num_mainshock_intervals):
                        gt_name = ssc_name + f"{event_count_str}-MS-{ms_bin + 1}-GT  "
                        gtd_content += f"{gt_name}, {self.event_description} MAINSHOCK BIN {ms_bin + 1} TRAIN{event_count_str}, {self.project_name} \n"
                        ftl_content += f"{ssc_name}{event_count_str}-MS-{ms_bin + 1}-GT            AND  HE-MS-{ms_bin + 1}   {ssc_name}{event_count_str}-MS-{ms_bin + 1}  \n"
                        file_ftl.write(gt_name)
                    file_ftl.write("\n")
                    ftl_content += "^EOS\n"
                    file_ftl.write(ftl_content)
                    file_gtd.write(gtd_content)
                    file_ftd.write(ftd_content)







    def write_mainshock_fault_tree1(self, output_directory,json_input,seismic_event_csv_path,ms_event_names,he_ms_names):

        # Extracting information from JSON file
        seismic_event_info = self.from_input_file(json_input)
        mainshock_params = seismic_event_info.mainshock_params
        num_mainshock_intervals = mainshock_params["num"]
        project_name = seismic_event_info.analysis_params["project"]
        correlation = mainshock_params["correlation"]

        # Fault Tree logic file (FTL)
        file_path_ftl = os.path.join(output_directory, "fault_tree.FTL")  # FTL file path
        file_path_ftd = os.path.join(output_directory, "fault_tree.FTD")  # FTD file path
        file_path_gtd = os.path.join(output_directory, "fault_tree.GTD")  # FTD file path
        reshaped_event_names = np.reshape(ms_event_names, (-1, num_mainshock_intervals))

        with open(file_path_ftl, 'a') as file_ftl, open(file_path_ftd, 'a') as file_ftd, open(file_path_gtd,'a') as file_gtd:
            file_ftd.write(f"{project_name}      =  \n*  Name                 , Description,        SubTree, Alternate, Project\n")
            file_gtd.write(f"{project_name}      =  \n*  Name                 , Description, Project\n")
            for row in reshaped_event_names:

                name_split = row[0].split("-")[:-1]
                if correlation =="Yes":
                    event_name = row[0].split("-")[0]
                else:
                    event_name = row[0].split("-")[0]
                    component_num = row[0].split("-")[1]


                # Modify each element in name_split using a list comprehension
                modified_name_split = [re.sub(r'[^a-zA-Z0-9-]', '', part) for part in name_split]

                # Join the modified elements back together with "-"
                combined_name = "-".join(modified_name_split)

                fault_tree_name = f"{combined_name}-FT"
                self.collect_fault_tree_name("MS",fault_tree_name)
                if correlation == "Yes":
                    file_ftd.write(f"{fault_tree_name}           , MAINSHOCK FAULT TREE OF   {self.get_event_description(event_name,seismic_event_csv_path)}             , S,  , {project_name}\n")
                else:
                    file_ftd.write(f"{fault_tree_name}           , MAINSHOCK FAULT TREE OF   {self.get_event_description(event_name,seismic_event_csv_path)} TRAIN {component_num}             , S,  , {project_name}\n")

                ms_ft_name = f"{project_name} ,   {fault_tree_name} = "
                file_ftl.write(ms_ft_name + '\n')


                ms_ft_name = f"{fault_tree_name}             OR "
                file_ftl.write(ms_ft_name)
                for event_name in row:

                    bin =self.extract_element_after_ms(event_name)


                    # Add "GT" prefix to the event name and write it to the file
                    gate_name = f"{event_name}-GT  "
                    file_gtd.write(f"{gate_name}  , MAINSHOCK BIN {bin} , {project_name}\n")
                    self.collect_gate_name("MS",gate_name)
                    file_ftl.write(gate_name)
                file_ftl.write('\n')

                for index ,event_name in enumerate(row):
                    gt_comp = f"{event_name}-GT                  AND  "
                    file_ftl.write(gt_comp)
                    file_ftl.write(f"{he_ms_names[index]} {event_name}\n")
                file_ftl.write("^EOS\n")

    def write_aftershock_fault_tree(self,output_directory,json_input,seismic_event_csv_path,ms_event_names,he_ms_names):

        pass



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
    def extract_element_after_ms(cls,text):
        elements = text.split("-")
        try:
            ms_index = elements.index("MS")
            if ms_index < len(elements) - 1:
                return elements[ms_index + 1]
            else:
                return None  # No element after "MS"
        except ValueError:
            return None  # "MS" not found

    def get_event_description(self, event_name, input_csv_path):
        seismic_event_data = pd.read_csv(input_csv_path)
        try:
            event_row = seismic_event_data[seismic_event_data['Event name'] == event_name]
            if not event_row.empty:
                event_description = event_row.iloc[0]['Event description']
                return event_description
        except KeyError:
            pass  # Handle the case where 'Event name' or 'Event description' column is missing

        return None  # Event description not found






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



    @classmethod
    def from_csv(cls, path,seismic_event_csv):  # This method reads the seismic event csv file
        complete_path = os.path.join(path, seismic_event_csv)

        events = []
        seismic_event_data = pd.read_csv(complete_path)
        for _, row in seismic_event_data.iterrows():
            event = cls()
            event.event_description = row['Event description']
            event.event_name = row['Event name']
            event.beta_u = row['BetaU']
            event.beta_r = row['BetaR']
            event.a_m = float(row['Am'])
            event.building = row['Building']
            event.floor = float(row['Floor'])
            event.elevation = float(row['Elevation'])
            event.area = row['Area']
            event.seismic_fire = row['Seismic fire?']
            event.seismic_flooding = row['Seismic flooding?']
            event.count = row['count']
            event.analysis_type = row['Analysis type']
            event.phase_type = row['Phase Type']
            event.project_name = row['Project']
            event.start_time= float(row["Start"])
            event.end_time = float(row["End"])

            events.append(event)
        return events
