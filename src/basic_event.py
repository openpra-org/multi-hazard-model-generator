import pandas as pd

class BasicEvent:
    def __init__(self, event_description, phase_type, probability_parameters, event_name, project_name, analysis_type):
        self.event_description = event_description
        self.phase_type = phase_type
        self.probability_parameters = probability_parameters
        self.event_name = event_name
        self.project_name = project_name
        self.analysis_type = analysis_type

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



csv_file = 'events.csv'  # Replace with the path to your CSV file
events = BasicEvent.from_csv(csv_file)

# Accessing event attributes
for event in events:
    print(event.event_description)
    print(event.phase_type)
    print(event.probability_parameters)
    print(event.event_name)
    print(event.project_name)
    print(event.analysis_type)