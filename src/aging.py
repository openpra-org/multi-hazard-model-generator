from src.imports import *

class AgingModel:
    def __init__(self, mongo_uri, database):
        self.client = MongoClient(mongo_uri)
        self.db = self.client[database]
        self.General_Input = self.db['General_Input']

    def update_failure_model(self, node):
        if node.failure_model and "aging_model" in node.failure_model:
            aging_type = node.failure_model["aging_model"].get("type")
            if aging_type:
                if aging_type == "linear":
                    self.linear_aging(node)
                elif aging_type == "corrosion":
                    self.corrosion_aging(node.id, node.failure_model["aging_model"])
                elif aging_type == "fatigue":
                    self.fatigue_aging(node.id, node.failure_model["aging_model"])

    def linear_aging(self, node):
        # Extract necessary parameters from the node
        aging_model = node.failure_model.get("aging_model", {})
        aging_rates = aging_model.get("aging_rate", 0)  # Default to 0 if not present

        # Retrieve the global time from the General_Input document
        general_input_doc = self.General_Input.find_one({})
        global_time = general_input_doc.get("Aging", {}).get("time")

        # Use the global time if present, otherwise use the default time from the node
        time = global_time if global_time is not None else aging_model.get("time", 10)

        # Check if aging_rates is a list or a single float
        if isinstance(aging_rates, list):
            # Iterate over affected parameters and update them
            affected_parameters = aging_model.get("affected_parameters", [])
            for i, parameter in enumerate(affected_parameters):
                alpha = aging_rates[i] if i < len(aging_rates) else 0

                current_value = node.failure_model.get(parameter, 0)
                new_value = current_value + alpha * time
                node.failure_model[parameter] = new_value
        else:
            # If aging_rates is a single float, update a single affected parameter
            affected_parameter = aging_model.get("affected_parameters", [])[0]  # Assume the first parameter
            current_value = node.failure_model.get(affected_parameter, 0)
            new_value = current_value + aging_rates * time
            node.failure_model[affected_parameter] = new_value

    def corrosion_aging(self, ssc_id, parameters):
        # Placeholder for corrosion aging calculation
        pass

    def fatigue_aging(self, ssc_id, parameters):
        # Placeholder for fatigue aging calculation
        pass
