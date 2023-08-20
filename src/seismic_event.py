from imports import *
from base_event import BaseEvent
from collections import Counter

class SeismicEvent(BaseEvent):
    event_name_categories = {}  # Define the class-level attribute
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

    def create_bei_file(self, output_directory, JSON_input):
        self.FdT = "J"
        self.UdT = "S"
        self.PF = ""
        self.Freq = "Y"
        self.Udc = ""
        self.UdValue = self.beta_r
        self.prob = self.a_m
        self.UdValue2 = self.beta_u

        # Call from_input_file method to get the mainshock and aftershock events parameters
        seismic_event_info = SeismicEvent.from_input_file(JSON_input)

        # Access the parameters from the seismic_event object
        aftershocks_params = seismic_event_info.aftershocks_params
        consider_aftershocks = aftershocks_params["consider_aftershocks"]



        mainshock_params = seismic_event_info.mainshock_params
        num_mainshock_intervals = mainshock_params["num"]
        mainshock_accel = mainshock_params["MS_vector"]
        os.makedirs(output_directory, exist_ok=True)
        file_path = os.path.join(output_directory, "Seismic_events.BEI")

        if not os.path.exists(file_path):
            with open(file_path, 'w') as file:
                file.write(
                    f"Project Name= {self.project_name}\n*  Name ,FdT,UdC   ,UdT, UdValue,   Prob,       Lambda,     Tau,        Mission, Init,PF, UdValue2,   Calc. Prob, Freq, Analysis Type   , Phase Type   , Project\n")
        with open(file_path, 'a') as file:

            if mainshock_params["correlation"] == "No":
                self.write_mainshock_basic_events(file, num_mainshock_intervals,mainshock_accel,self.count)
            else:
                self.write_mainshock_basic_events(file, num_mainshock_intervals,mainshock_accel)

            if consider_aftershocks == "Yes":
                if mainshock_params["correlation"] == "No":
                    self.write_aftershock_basic_events(file, aftershocks_params,mainshock_accel,self.count)

                else:
                    self.write_aftershock_basic_events(file, aftershocks_params,mainshock_accel)



    def write_mainshock_basic_events(self, file, num_mainshock_intervals, mainshock_accel, count=1):
        _, file_extension = os.path.splitext(file.name)
        if file_extension.upper() == ".BEI":
            content = ""
            for event_count in range(1, count + 1):
                event_count_str = "" if count == 1 else f"-{chr(64 + event_count)}"
                for mainshock_bin in range(1, num_mainshock_intervals + 1):
                    event_name = f"{self.event_name}-MS-{mainshock_bin}{event_count_str}".upper()
                    content += f"{event_name}, {self.FdT},{self.UdC} , {self.UdT},{self.UdValue},{self.prob},{mainshock_accel[mainshock_bin - 1]}, {self.Tau}, {self.mission},{self.init},{self.PF},{self.UdValue2}, ,{self.Freq},{self.analysis_type},{self.phase_type}, {self.project_name}\n"
                    self.collect_event_name("MS", event_name)
            file.write(content)

        elif file_extension.upper() == ".BED":
            content = ""

            for event_count in range(1, count + 1):
                event_count_str = "" if count == 1 else f"-{chr(64 + event_count)}"

                for mainshock_bin in range(1, num_mainshock_intervals + 1):
                    event_name = f"{self.event_name}-MS-{mainshock_bin}{event_count_str}".upper()
                    event_description_with_bin = f"{self.event_description} Mainshock Bin-{mainshock_bin}{event_count_str}"
                    content += f"{event_name},{event_description_with_bin}, {self.project_name}\n"
            file.write(content)
    def write_aftershock_basic_events(self, file, aftershocks_params,mainshock_accel,count = 1):
        num_aftershocks = aftershocks_params["num"]
        delta_T=aftershocks_params["dt"]  # aftershock time interval
        aftershock_accel =  aftershocks_params["vector"]
        geometric_means = np.sqrt(np.array(aftershock_accel[:-1]) * np.array(aftershock_accel[1:]))
        _, file_extension = os.path.splitext(file.name)
        if file_extension.upper() == ".BEI":
            content = ""
            for event_count in range(1, count + 1):
                event_count_str = "" if count == 1 else f"-{chr(64 + event_count)}"
                for aftershock_bin in range(1, len(geometric_means) + 1):
                    event_name = f"{self.event_name}-AS-{aftershock_bin}{event_count_str}".upper()
                    content += f"{event_name}, {self.FdT},{self.UdC} , {self.UdT},{self.UdValue},{self.prob},{geometric_means[aftershock_bin - 1]}, {self.Tau}, {self.mission},{self.init},{self.PF},{self.UdValue2}, ,{self.Freq},{self.analysis_type},{self.phase_type}, {self.project_name}\n"
                    self.collect_event_name("AS", event_name)

            file.write(content)

        elif file_extension.upper() == ".BED":
            content = ""

            for event_count in range(1, count + 1):
                event_count_str = "" if count == 1 else f"-{chr(64 + event_count)}"

                for aftershock_bin in range(1, len(geometric_means) + 1):
                    event_name = f"{self.event_name}-AS-{aftershock_bin}{event_count_str}".upper()
                    event_description_with_bin = f"{self.event_description} Aftershock Bin-{aftershock_bin}{event_count_str}"
                    content += f"{event_name},{event_description_with_bin}, {self.project_name}\n"
            file.write(content)



    def create_bed_file(self, output_directory, JSON_input):
        file_path = os.path.join(output_directory, "seismic_event.BED")  # BED file path

        # Call from_input_file method to get the mainshock and aftershock events parameters
        seismic_event_info = SeismicEvent.from_input_file(JSON_input)

        # Access the parameters from the seismic_event object
        aftershocks_params = seismic_event_info.aftershocks_params
        consider_aftershocks = aftershocks_params["consider_aftershocks"]
        mainshock_params = seismic_event_info.mainshock_params
        num_mainshock_intervals = mainshock_params["num"]
        mainshock_accel = mainshock_params["MS_vector"]

        if not os.path.exists(file_path):
            with open(file_path, 'w') as file:
                file.write(f"{self.project_name}=\n*Name         , Descriptions, Project\n")

        with open(file_path, 'a') as file:

            if mainshock_params["correlation"] == "No":
                self.write_mainshock_basic_events(file, num_mainshock_intervals, mainshock_accel, self.count)
            else:
                self.write_mainshock_basic_events(file, num_mainshock_intervals, mainshock_accel)

            if consider_aftershocks == "Yes":
                if mainshock_params["correlation"] == "No":
                    self.write_aftershock_basic_events(file, aftershocks_params,mainshock_accel ,self.count)
                else:
                    self.write_aftershock_basic_events(file, aftershocks_params,mainshock_accel)

    @staticmethod
    def is_event_duplicated(file_path, event_name): # Checking if an event was duplicated
        with open(file_path, 'r') as file:
            for line in file:
                if event_name in line:
                    return True
        return False

    def create_bec_file(self, output_directory, JSON_input):

        # Retrieve event names for each category
        as_event_names = SeismicEvent.get_events_by_category("AS")
        as_fq_event_names = SeismicEvent.get_events_by_category("AS_FQ")

        file_path = os.path.join(output_directory, "seismic_event.BEC")  # BED file path

        bec_event_names = []

        if not os.path.exists(file_path):
            with open(file_path, 'w') as file:
                file.write(
                    f"{self.project_name}=\n* Name  , tTypeName, COM, DLL Name, Proc Name, ModelType, PhaseType, Project \n * consts, params, ...\n * ^EOS\n")

        content = ""

        for as_event in as_event_names:
            # Extract the number after "AS-" from the event name
            as_number = int(as_event.split("-")[2])  # Extracts the number after "AS-"
            # Find matching events in as_fq_event_names
            matching_fq_events = [fq_event for fq_event in as_fq_event_names if f"-AS-{as_number}-" in fq_event]
            # Combine and create BEC event names
            for fq_event in matching_fq_events:
                combined_name = f"{as_event}-{fq_event.split('-')[1]}-{fq_event.split('-')[2]}-{fq_event.split('-')[5]}-{fq_event.split('-')[6]}-CE"
                combined_name = re.sub(r'[^a-zA-Z0-9-]', '', combined_name)

                bec_event_names.append(combined_name)
                self.collect_event_name("CE", combined_name)
                content += f"{combined_name},            0,COM,PLUGUTIL, MULT ,{self.analysis_type},{self.phase_type}, {self.project_name}\n"
                content += f"{as_event}, {fq_event}\n"
                content+= "^EOS\n"
        # Open the file again and write the content
        with open(file_path, 'a') as file:
            file.write(content)




    def aftershock_frequency_event_write(self, output_directory, JSON_input):
        # Write frequency events inside BEI file
        file_path_bei = os.path.join(output_directory, "Seismic_events.BEI")
        file_path_bed = os.path.join(output_directory, "seismic_event.BED")

        # Call from_input_file method to get the mainshock and aftershock events parameters
        seismic_event_info = SeismicEvent.from_input_file(JSON_input)

        # Access the parameters from the seismic_event object
        aftershocks_params = seismic_event_info.aftershocks_params
        consider_aftershocks = aftershocks_params["consider_aftershocks"]
        mainshock_params = seismic_event_info.mainshock_params
        num_mainshock_intervals = mainshock_params["num"]
        mainshock_accel = mainshock_params["MS_vector"]
        num_aftershocks = aftershocks_params["num"]
        delta_T = aftershocks_params["dt"]  # aftershock time interval
        mission = aftershocks_params["mission"]  # aftershock time interval
        aftershock_accel = aftershocks_params["vector"]

        with open(file_path_bei, 'a') as file_bei, open(file_path_bed, 'a') as file_bed:
            for mainshock_bin, mainshock_PGA in enumerate(mainshock_accel):
                # Frequency events writing


                for S in range(0+delta_T, int(mission)+delta_T, int(delta_T)):
                    number_aftershocks, aftershock_accel = self.mean_aftershocks_number(aftershocks_params,
                                                                                        mainshock_PGA, S,
                                                                                        S + delta_T)
                    content_bei = ""
                    content_bed = ""
                    for index, freq in enumerate(number_aftershocks):
                        event_name = f"Freq-MS-{mainshock_bin + 1}-AS-{index + 1}-T-{S}".upper()
                        content_bei += f"{event_name}, V, , ,0,{freq},0, 0, 0,,,,{freq} ,,{self.analysis_type},{self.phase_type}, {self.project_name}\n"
                        content_bed += f"{event_name}, FREQUENCY OF AS BIN {index+1} AT TIME {S} AFTER MS BIN {mainshock_bin+1} ,{self.project_name}\n"
                        self.collect_event_name("AS_FQ", event_name)

                    file_bei.write(content_bei)
                    file_bed.write(content_bed)

    def mean_aftershocks_number(self,aftershocks_params,mainshock_PGA,S,E):

        a = aftershocks_params["AF_arrival_params"]["a"]  # Read 'a' from aftershock_params
        b = aftershocks_params["AF_arrival_params"]["b"]  # Read 'b' from aftershock_params
        c = aftershocks_params["AF_arrival_params"]["c"]  # Read 'c' from aftershock_params
        p = aftershocks_params["AF_arrival_params"]["p"]  # Read 'p' from aftershock_params
        alpha = aftershocks_params["AF_arrival_params"]["alpha"]  # Read 'alpha' from aftershock_params
        aftershocks_acceleration_vector = aftershocks_params["vector"]  # Use the aftershock vector from aftershock_params

        number_aftershocks = [
            ((10) ** a) * ((mainshock_PGA / aftershock_PGA) ** (alpha * b)) * (1 / (1 - p)) * (
                    (E + c) ** (1 - p) - (S + c) ** (1 - p))
            for aftershock_PGA in aftershocks_acceleration_vector
        ]

        aftershock_acceleration_array = np.array(aftershocks_acceleration_vector)
        geometric_mean = np.sqrt(aftershock_acceleration_array[:-1] * aftershock_acceleration_array[1:])

        return number_aftershocks[:-1], geometric_mean



    def write_house_event(self,output_directory,JSON_input):

        file_path_bei = os.path.join(output_directory, "Seismic_events.BEI")
        file_path_bed = os.path.join(output_directory, "seismic_event.BED")

        # Call from_input_file method to get the mainshock and aftershock events parameters
        seismic_event_info = SeismicEvent.from_input_file(JSON_input)

        # Access the parameters from the seismic_event object
        aftershocks_params = seismic_event_info.aftershocks_params
        consider_aftershocks = aftershocks_params["consider_aftershocks"]

        mainshock_params = seismic_event_info.mainshock_params
        num_mainshock_intervals = mainshock_params["num"]

        num_aftershocks = aftershocks_params["num"]
        delta_T = aftershocks_params["dt"]  # aftershock time interval
        mission = aftershocks_params["mission"]  # aftershock time interval
        aftershock_accel = aftershocks_params["vector"]

        content_bei = ""
        content_bed = ""
        # Mainshock hoyse event writing
        with open(file_path_bei, 'a') as file_bei, open(file_path_bed, 'a') as file_bed:
            for mainshock_bin_num in range(num_mainshock_intervals):
                event_name = f"HE-MS-{mainshock_bin_num + 1}".upper()
                content_bei += f"{event_name}, F, 0.000E+000 ,  , 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, 0.000E+000,Y,{self.analysis_type}\n"
                content_bed += f"{event_name}, MAINSHOCK BIN  {mainshock_bin_num + 1} OCCURS ,{self.project_name}\n"
                self.collect_event_name("HE_MS",event_name)
            file_bed.write(content_bed)
            file_bei.write(content_bei)

        # Aftershock arrival house event  writing
        content_bei = ""
        content_bed = ""
        with open(file_path_bei, 'a') as file_bei, open(file_path_bed, 'a') as file_bed:
            for S in range(0+delta_T, int(mission)+delta_T, int(delta_T)):
                event_name = f"HE-T-{S}".upper()
                content_bei += f"{event_name}, F, 0.000E+000 ,  , 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, 0.000E+000,Y,{self.analysis_type}\n"
                content_bed += f"{event_name}, AFTERSHOCKS OCCUR BETWEEN TIME {S-   delta_T} AND {S} HR,{self.project_name}\n"
                self.collect_event_name("HE_T",event_name)
            file_bed.write(content_bed)
            file_bei.write(content_bei)


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

    @classmethod
    def collect_event_name(cls, category, event_name):
        if category not in cls.event_name_categories:
            cls.event_name_categories[category] = []
        cls.event_name_categories[category].append(event_name)

    @classmethod
    def get_events_by_category(cls, category):
        events_of_category = cls.event_name_categories.get(category, [])
        return events_of_category


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
