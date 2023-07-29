from imports import *
from base_event import BaseEvent

class SeismicEvent(BaseEvent):
    def __init__(self, event_description="", phase_type="", probability_parameters=None,
                 event_name="", project_name="", analysis_type="", Lambda=0, tau=0, prob=0,
                 mission=0, UdC="", FdT=0, UdValue=0, UdValue2=0, init=0, PF=0, Freq=0, Tau = 0,
                 beta_u=0, beta_r=0, a_m=0, building="", floor=0, elevation=0, area="",
                 count=0, seismic_fire="", seismic_flooding="", peak_ground_accel=0):
        super().__init__(event_description, phase_type, probability_parameters,
                         event_name, project_name, analysis_type, Lambda, tau, prob,
                         mission, UdC, FdT, UdValue, UdValue2, init, PF, Freq,Tau ,beta_u,
                         beta_r, a_m, building, floor, elevation, area, count,
                         seismic_fire, seismic_flooding, peak_ground_accel)
        self.aftershocks_params = None
        self.mainshock_params = None

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
                    self.write_aftershock_basic_events(file, aftershocks_params,self.count)
                else:
                    self.write_aftershock_basic_events(file, aftershocks_params)



    def write_mainshock_basic_events(self, file, num_mainshock_intervals, mainshock_accel, count=1):
        _, file_extension = os.path.splitext(file.name)
        if file_extension.upper() == ".BEI":
            content = ""
            for event_count in range(1, count + 1):
                event_count_str = "" if count == 1 else f"-{chr(64 + event_count)}"
                for mainshock_bin in range(1, num_mainshock_intervals + 1):
                    event_name = f"{self.event_name}-MS-{mainshock_bin}{event_count_str}".upper()
                    content += f"{event_name}, {self.FdT},{self.UdC} , {self.UdT},{self.UdValue},{self.prob},{mainshock_accel[mainshock_bin - 1]}, {self.Tau}, {self.mission},{self.init},{self.PF},{self.UdValue2}, ,{self.Freq},{self.analysis_type},{self.phase_type}, {self.project_name}\n"

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
    def write_aftershock_basic_events(self, file, aftershocks_params,count = 1):
        num_aftershocks = aftershocks_params["num"]
        _, file_extension = os.path.splitext(file.name)
        if file_extension.upper() == ".BEI":


            aftershock_accel = aftershocks_params["vector"]
            content = ""
            for event_count in range(1, count + 1):
                event_count_str = "" if count == 1 else f"-{chr(64 + event_count)}"
                for aftershock_bin in range(1, num_aftershocks + 1):
                    event_name = f"{self.event_name}-AS-{aftershock_bin}{event_count_str}".upper()
                    content += f"{event_name}, {self.FdT},{self.UdC} , {self.UdT},{self.UdValue},{self.prob},{aftershock_accel[aftershock_bin - 1]}, {self.Tau}, {self.mission},{self.init},{self.PF},{self.UdValue2}, ,{self.Freq},{self.analysis_type},{self.phase_type}, {self.project_name}\n"

            file.write(content)

        elif file_extension.upper() == ".BED":
            content = ""

            for event_count in range(1, count + 1):
                event_count_str = "" if count == 1 else f"-{chr(64 + event_count)}"

                for aftershock_bin in range(1, num_aftershocks + 1):
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
                    self.write_aftershock_basic_events(file, aftershocks_params, self.count)
                else:
                    self.write_aftershock_basic_events(file, aftershocks_params)

    @staticmethod
    def is_event_duplicated(file_path, event_name): # Checking if an event was duplicated
        with open(file_path, 'r') as file:
            for line in file:
                if event_name in line:
                    return True
        return False

    def create_bec_file(self, output_directory):
        pass





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

            events.append(event)
        return events



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
