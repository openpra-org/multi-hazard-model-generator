from imports import *
from base_event import BaseEvent
class BasicEvent(BaseEvent):
    def __init__(self):

        super().__init__()

    def create_bed_file(self):

        output_directory = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "output", "general")
        os.makedirs(output_directory, exist_ok=True)
        file_path = os.path.join(output_directory, "basic_event.BED")

        if not os.path.exists(file_path):
            with open(file_path, 'w') as file:
                file.write(f"{self.project_name}=\n*Name         , Descriptions, Project\n")

        content = f"{self.event_name.upper():<16} ,   {self.event_description},  {self.project_name.upper()}\n"

        if self.is_event_duplicated(file_path, self.event_name):
            return f"Warning: Event '{self.event_name}' is duplicated. Skipping..."

        with open(file_path, 'a') as file:
            file.write(content)

        return f"{file_path} created/updated successfully."

    @classmethod
    def from_csv(cls, csv_file):
        df = pd.read_csv(csv_file)
        events = []
        for _, row in df.iterrows():
            event_description = row['Event description']
            phase_type = row['Phase Type']
            event_name = row['Event name']
            project_name = row['Project']
            analysis_type = row['Analysis type']
            Lambda =float(row['Lambda'])
            tau = float(row['Tau'])
            prob = float(row['Prob'])
            mission= float(row['Mission'])
            FdT = row['FdT']
            UdC= row['UdC']
            UdValue = row["UdValue"]
            init = row['Init']
            PF = row["PF"]
            Freq = row["Freq"]

            event = cls(event_description, phase_type, event_name, project_name, analysis_type,Lambda,tau,mission,prob,UdC,FdT,UdValue,init,PF,Freq)
            events.append(event)
        return events

    @staticmethod
    def get_probability_parameters(row):
        parameters = {
            'lambda': float(row['Lambda']), # Basic event failure rate per hr
            'tau': float(row['Tau']),  # Time to repair in hours
            'prob': float(row['Prob']),  # Probability value
            'FdT': row['FdT'], # Failure Calculation type (one character)
            'UdC': row['UdC'], # Uncertainty correlation class Events in same class are 100% correlated.
            'UdValue':float(row['UdValue']), # Uncertainty distribution value
            'Mission': float(row['Mission'])  # Mission time
        }
        return parameters


    @staticmethod
    def is_event_duplicated(file_path, event_name):
        with open(file_path, 'r') as file:
            lines = file.readlines()
            event_names = [line.split(',')[0].strip() for line in lines[2:]]  # Exclude the header lines
            return any(event_name.upper() == line.strip().split(',')[0].strip() for line in lines[2:])

    def create_bei_file(self):


        output_directory = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "output",
                                        "general")
        os.makedirs(output_directory, exist_ok=True)
        file_path = os.path.join(output_directory, "basic_event.BEI")

        if not os.path.exists(file_path):
            with open(file_path, 'w') as file:

                file.write(f"Project Name= {self.project_name}\n*  Name ,FdT,UdC   ,UdT, UdValue,   Prob,       Lambda,     Tau,        Mission, Init,PF, UdValue2,   Calc. Prob, Freq, Analysis Type        , Phase Type              , Project\n")
        content = f"{self.event_name.upper():<16}, {self.FdT},{self.UdC} , {self.UdT},{self.UdValue},{self.prob},{self.Lambda}, {self.Tau}, {self.Mission},{self.Init},{self.PF},{self.UdValue2}, ,{self.Freq},{self.analysis_type},{self.phase_type}, {self.project_name} \n "


        if self.is_event_duplicated(file_path, self.event_name):
            return f"Warning: Event '{self.event_name}' is duplicated. Skipping..."

        with open(file_path, 'a') as file:
            file.write(content)



        return f"{file_path} created/updated successfully."

    def create_bec_file(self):
        # Code to create .BEC file
        file_name = f"{self.event_name}.BEC"
        # Write contents to the .BEC file

    def create_unused_file_extension(self):
        # Code to create unused file extension
        file_name = f"{self.event_name}.XXX"
        # Write contents to the .XXX file









