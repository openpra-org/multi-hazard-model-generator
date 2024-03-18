from src.imports import *
class HumanReliabilityModels:
    def __init__(self, node):
        self.node = node
        self.IDHEASModel = self.IDHEASModel(node)
        self.SPARHModel = self.SPARHModel(node)
    class IDHEASModel:
        def __init__(self, node):  # Accept node as a parameter
            self.node = node  # Store node as an instance attribute

        def idheas_model(self):
            """
            Implements the IDHEAS (Integrated Decision-making and Human Error Analysis System) model.
            :return: Probability of human error or failure.
            """
            failure_model = self.node.failure_model

            # Check if the failure model exists and the HRA model is IDHEAS
            if failure_model and failure_model.get("HRA_model") == "IDHEAS":
                # Extract factors from the failure model
                HSI = failure_model.get("HSI", "")
                urgency = failure_model.get("Urgency", "")
                cognitive_workload = failure_model.get("cognitive_workload", "")

                # Define the DT path based on the provided factors
                DT_path = f"{cognitive_workload}{HSI}{urgency}"

                # Define the failure probability based on the DT path
                failure_probability = self._calculate_failure_probability_idheas_model(DT_path)

                # Update the failure model with distribution_type and prob
                failure_model["distribution_type"] = "P"
                failure_model["prob"] = failure_probability



                return self.node
            else:
                raise ValueError("Invalid or missing HRA model specified for the node")

        def _calculate_failure_probability_idheas_model(self, DT_path):
            """
            Calculate the failure probability based on the DT path.
            :param DT_path: Decision tree path.
            :return: Probability of human error or failure.
            """
            # Placeholder for the table of different combinations of factors and their probabilities
            # Replace with the actual implementation using the provided table
            probabilities_table = {
                "HighPoorLow": 0.25,
                "HighPoorHigh": 0.098,
                "HighGoodLow": 0.065,
                "HighGoodHigh": 0.0044,
                "LowPoorLow": 0.0073,
                "LowPoorHigh": 0.00096,
                "LowGood-": 0.000024
            }

            # Lookup the failure probability based on the DT path
            failure_probability = probabilities_table.get(DT_path, None)

            if failure_probability is not None:
                return failure_probability
            else:
                raise ValueError(f"Invalid decision tree path: {DT_path}")

    class SPARHModel:
        def __init__(self, node):
            self.node = node

        def process_failure_model(self):
            failure_model = self.node.failure_model
            if failure_model.get("HRA_model") == "SPAR-H":

                diagnosis = failure_model.get("Diagnosis", {})
                action = failure_model.get("Action", {})
                dependency = failure_model.get("Dependency", {})
                multiplier = self.load_multiplier()

                # Process Diagnosis
                diagnosis_score = self.calculate_score(diagnosis, multiplier) * 1e-2
                # Cap the diagnosis score at 1 if it exceeds 1
                diagnosis_score = min(diagnosis_score, 1)

                # Process Action
                action_score = self.calculate_score(action, multiplier) * 1e-3
                # Cap the action score at 1 if it exceeds 1
                action_score = min(action_score, 1)

                # Process Dependency
                # Since Dependency is a single document, we can directly multiply its fields
                dependency_score = {key: value * multiplier.get(key, 1) for key, value in dependency.items()}

                total_score = action_score + diagnosis_score
                if total_score > 1:
                    total_score = 1

                print("Total score:", total_score)
                # Add distribution_type and prob to failure_model
                failure_model['distribution_type'] = "P"
                failure_model['prob'] = total_score

            return self.node

        def load_multiplier(self):
            # Load the multiplier document from database or file
            multiplier = {
                "Available Time": {
                    "Inadequate Time": 1E6,
                    "Barely Adequate Time":10,
                    "Nominal Time": 1,
                    "Extra Time": 0.1,
                    "Expansive Time": 0.01,
                    "Insufficient Information": 1
                },
                "Stress/Stressors": {
                    "Extreme": 5,
                    "High": 2,
                    "Nominal": 1,
                    "Insufficient Information": 1
                },
                "Complexity": {
                    "Highly Complex": 5,
                    "Insufficient Information": 1,
                    "Moderately Complex": 2,
                    "Nominal": 1,
                    "Obvious diagnosis": 0.1
                },
                "Experience/Training": {
                    "Low": 10,
                    "Nominal": 1,
                    "High": 0.5,
                    "Insufficient Information": 1
                },
                "Procedures": {
                    "Not Available": 50,
                    "Incomplete": 20,
                    "Available^ but poor": 5,
                    "Nominal": 1,
                    "Diagnostic/Symptom oriented": 0.5,
                    "Insufficient Information": 1
                },
                "Ergonomics/HMI": {
                    "Missing/misleading": 50,
                    "Poor": 10,
                    "Nominal": 1,
                    "Good": 0.5,
                    "Insufficient Information": 1
                },
                "Fitness for Duty": {
                    "Unfit": 100,
                    "Degraded fitness": 5,
                    "Nominal": 1,
                    "Insufficient Information": 1
                },
                "Work Processes": {
                    "Poor": 2,
                    "Nominal": 1,
                    "Good": 0.8,
                    "Insufficient Information": 1
                }
            }
            return multiplier

        def calculate_score(self, category, multiplier):
            score_dict = {}  # Dictionary to store scores for each main_key
            for main_key, sub_dict in category.items():
                sub_values_sum = sum(sub_dict.values())
                if not np.isclose(sub_values_sum, 100):
                    raise ValueError(f"The values of sub_keys under main_key '{main_key}' do not sum up to 100")

                for sub_key, value in sub_dict.items():
                    # Handle keys with forward slashes
                    multiplier_value = multiplier.get(main_key.replace("/", "__"), {}).get(sub_key, None)
                    if multiplier_value is not None and value != 0:
                        if isinstance(multiplier_value, (int, float)):
                            # If main_key exists in score_dict, add the score, otherwise, multiply
                            if main_key in score_dict:
                                score_dict[main_key] += value * 0.01 * multiplier_value
                            else:
                                score_dict[main_key] = value * 0.01 * multiplier_value


            # Calculate the overall score by multiplying the values in score_dict
            overall_score = 1
            for score in score_dict.values():
                overall_score *= score

            return overall_score

