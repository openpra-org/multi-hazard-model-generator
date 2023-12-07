from src.imports import *

class AgingModel:
    def __init__(self, mongo_uri, database):
        self.client = MongoClient(mongo_uri)
        self.db = self.client[database]
        self.ssc_collection = self.db['ssc']

    def update_failure_model(self, node):
        if node.failure_model and "aging_model" in node.failure_model:
            aging_type = node.failure_model["aging_model"].get("type")
            if aging_type:
                if aging_type == "linear":
                    alpha = node.failure_model["aging_model"].get("aging_rate", 1.0)
                    time = node.failure_model["aging_model"].get("time", 10)
                    self.linear_aging(node.id, alpha, time)
                elif aging_type == "corrosion":
                    self.corrosion_aging(node.id, node.failure_model["aging_model"])
                elif aging_type == "fatigue":
                    self.fatigue_aging(node.id, node.failure_model["aging_model"])

    def linear_aging(self, ssc_id, alpha, time):
        # Some sort of calculation for linear aging
        initial_capacity = self._get_initial_capacity(ssc_id)
        current_capacity = initial_capacity - alpha * time
        self._update_failure_model(ssc_id, current_capacity)

    def corrosion_aging(self, ssc_id, parameters):
        # Placeholder for corrosion aging calculation
        pass

    def fatigue_aging(self, ssc_id, parameters):
        # Placeholder for fatigue aging calculation
        pass

    def _get_initial_capacity(self, ssc_id):
        # Retrieve initial capacity from the document
        ssc = self.ssc_collection.find_one({'_id': ssc_id})
        return ssc['failure_model']['aging_model']['initial_median_seismic_capacity']

    def _update_failure_model(self, ssc_id, new_capacity):
        # Update the capacity in the document
        self.ssc_collection.update_one(
            {'_id': ssc_id},
            {'$set': {'failure_model.aging_model.current_median_seismic_capacity': new_capacity}}
        )
