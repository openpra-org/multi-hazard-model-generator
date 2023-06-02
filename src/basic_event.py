import os
import pandas as pd

class BasicEvent:
    def __init__(self, event_description, phase_type, probability_parameters, event_name, project_name, analysis_type):
        self.event_description = event_description
        self.phase_type = phase_type
        self.probability_parameters = probability_parameters
        self.event_name = event_name
        self.project_name = project_name
        self.analysis_type = analysis_type

    def create_bed_file(self):
        if self.event_name.islower():
            return f"Error: Event name ({self.event_name}) should be capitalized."

        output_directory = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "output", "general")
        os.makedirs(output_directory, exist_ok=True)
        file_path = os.path.join(output_directory, "basic_event.BED")

        if not os.path.exists(file_path):
            with open(file_path, 'w') as file:
                file.write("Project Name=\n* Name             , Descriptions, A, Analysis Type, Phase Type\n")

        content = f"{self.event_name.upper():<16}, {self.event_description}, , {self.analysis_type.upper()}, \n"
        if self.is_event_duplicated(file_path,event.event_name):
            return f"Warning: Event '{self.event_name}' is duplicated. Skipping..."

        content = f"{self.event_name.upper():<16}, {self.event_description}, , {self.analysis_type.upper()}, \n"

        with open(file_path, 'a') as file:
            file.write(content)

        return f"{file_path} created/updated successfully."

    @classmethod
    def from_csv(cls, csv_file):
        df = pd.read_csv(csv_file)
        events = []
        for _, row in df.iterrows():
            event_description = row['event description']
            phase_type = row['Phase Type']
            probability_parameters = cls.get_probability_parameters(row)
            event_name = row['event name']
            project_name = row['project name']
            analysis_type = row['analysis type']
            event = cls(event_description, phase_type, probability_parameters, event_name, project_name, analysis_type)
            events.append(event)
        return events

    @staticmethod
    def get_probability_parameters(row):
        parameters = {
            'lambda': float(row['lambda']),
            'tau': float(row['tau']),
            'prob': float(row['prob']),
            'FdT': float(row['FdT']),
            'UdC': float(row['UdC']),
            'UdValue': float(row['UdValue']),
            'Mission': float(row['Mission'])
        }
        return parameters


    @staticmethod
    def is_event_duplicated(file_path, event_name):
        with open(file_path, 'r') as file:
            lines = file.readlines()
            event_names = [line.split(',')[0].strip() for line in lines[2:]]  # Exclude the header lines
            return any(event_name.upper() == line.strip().split(',')[0].strip() for line in lines[2:])


    def create_bei_file(self):
        # Code to create .BEI file
        file_name = f"{self.event_name}.BEI"
        # Write contents to the .BEI file

    def create_bec_file(self):
        # Code to create .BEC file
        file_name = f"{self.event_name}.BEC"
        # Write contents to the .BEC file

    def create_unused_file_extension(self):
        # Code to create unused file extension
        file_name = f"{self.event_name}.XXX"
        # Write contents to the .XXX file









csv_file = 'events.csv'
events = BasicEvent.from_csv(csv_file)



for event in events:
    result = event.create_bed_file()
    print(result)