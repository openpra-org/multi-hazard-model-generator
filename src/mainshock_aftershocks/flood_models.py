class FloodModel:
    def __init__(self, node):
        self.node = node

    class InternalFlood:
        def __init__(self):
            pass

        def handle_internal_flood(self, node, file):
            # Internal flood handling logic
            pass




    class Tsunami:
        def __init__(self):
            pass

        def tsunami_inundation_failure(self, node, file):
            failure_model = node.failure_model
            if failure_model.get("distribution_type") == "FL" and failure_model.get("flood_type") == "Tsunami":
                name = node.name
                FdT = "J"
                UdC = node.correlation_set if hasattr(node, "correlation_set") else ""
                UdT = "S"
                UdValue = failure_model.get("beta_r_uncertainty")
                Prob = failure_model.get("median_water_capacity")
                Lambda = failure_model.get("max_wave_height")

                if None in (UdValue, Prob, Lambda):
                    error_params = [param for param, value in
                                    [("beta_r_uncertainty", UdValue), ("median_water_capacity", Prob),
                                     ("max_wave_height", Lambda)]
                                    if value is None]
                    raise ValueError(
                        f"Some parameters in failure_model are None for node '{name}' with description '{node.description}': {error_params}")

                Tau = "0.000E+000"
                Mission = "0.000E+000"
                Init = ""
                PF = ""
                UdValue2 = failure_model.get("beta_u_uncertainty")
                Calc_Prob = ""
                Freq = ""
                Analysis_Type = "RANDOM"
                Phase_Type = "CD"
                Project = "G-PWR"

                file.write(
                    f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
                )
            else:
                raise ValueError(
                    f"Invalid distribution_type for flood model or failure_model is None for node '{node.name}' with description '{node.description}'")

        def tsunami_flow_velocity_failure(self, node, file):
            failure_model = node.failure_model
            if failure_model.get("distribution_type") == "FL" and failure_model.get("flood_type") == "Tsunami":
                name = node.name
                FdT = "J"
                UdC = node.correlation_set if hasattr(node, "correlation_set") else ""
                UdT = "S"
                UdValue = failure_model.get("beta_r_uncertainty")
                Prob = failure_model.get("median_velocity_capacity")  # Changed parameter name
                Lambda = failure_model.get("max_wave_velocity")  # Changed parameter name

                if None in (UdValue, Prob, Lambda):
                    error_params = [param for param, value in
                                    [("beta_r_uncertainty", UdValue), ("median_velocity_capacity", Prob),
                                     ("max_wave_velocity", Lambda)]
                                    if value is None]
                    raise ValueError(
                        f"Some parameters in failure_model are None for node '{name}' with description '{node.description}': {error_params}")

                Tau = "0.000E+000"
                Mission = "0.000E+000"
                Init = ""
                PF = ""
                UdValue2 = failure_model.get("beta_u_uncertainty")
                Calc_Prob = ""
                Freq = ""
                Analysis_Type = "RANDOM"
                Phase_Type = "CD"
                Project = "G-PWR"

                file.write(
                    f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
                )
            else:
                raise ValueError(
                    f"Invalid distribution_type for flood model or failure_model is None for node '{node.name}' with description '{node.description}'")

    def handle_flood(self, node, file):
        failure_model = node.failure_model
        if node.type == "FLD":
            flood_type = failure_model.get("flood_type")
            if flood_type:
                if flood_type == "Internal":
                    internal_flood = self.InternalFlood()
                    internal_flood.handle_internal_flood(node, file)
                elif flood_type == "Tsunami":
                    tsunami = self.Tsunami()
                    if failure_model.get("failure_mode") == "inundation":
                        tsunami.tsunami_inundation_failure(node, file)
                    elif failure_model.get("failure_mode") == "flow_force":
                        tsunami.tsunami_flow_velocity_failure(node, file)

                else:
                    raise ValueError("Invalid flood type specified in the failure model")
            else:
                raise ValueError("Missing or invalid 'flood_type' in the failure model")
        else:
            raise ValueError(f"Invalid type '{node.type}' for flood model")
