from src.imports import *

class BasicEventWriter:
    def __init__(self):
        pass

    def seismic_model(self, node, file):
        # Check if the node has the failure_model with distribution_type "SL"
        if (
            node.failure_model
            and node.failure_model.get("distribution_type") == "SL"
        ):
            # Define the parameters based on the provided criteria
            name = node.name
            FdT = "J"
            UdC = getattr(node, "correlation_set", "") or ""
            UdT = "S"
            UdValue = node.failure_model.get("beta_r_uncertainty", "")
            Prob = node.failure_model.get("median_seismic_acceleration", "")
            Lambda = node.failure_model.get("pga", "")  # test this
            Tau = "0.000E+000"
            Mission = "0.000E+000"
            Init = ""
            PF = ""
            UdValue2 = node.failure_model.get("beta_u_uncertainty", "")
            Calc_Prob = ""
            Freq = ""
            Analysis_Type = "RANDOM"
            Phase_Type = "CD"
            Project = "G-PWR"

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )



        else:
            raise ValueError("Invalid distribution_type for seismic model")

    def flood_model(self, node, file):
        # Check if the node has the failure_model with distribution_type "FL"
        failure_model = node.failure_model

        if failure_model and failure_model.get("distribution_type") == "FL":
            # Define the parameters based on the provided criteria
            name = node.name
            FdT = "J"
            UdC = getattr(node, "correlation_set", "") or ""
            UdT = "S"  # Change this to "T" for Flood distribution type

            # Check and retrieve values from failure_model, raising ValueError if any are None
            UdValue = failure_model.get("beta_r_uncertainty")
            Prob = failure_model.get("median_flood_depth")
            Lambda = failure_model.get("flood_level")

            # Check for None values and raise ValueError with detailed error message
            if None in (UdValue, Prob, Lambda):
                error_params = [param for param, value in
                                [("beta_r_uncertainty", UdValue), ("median_flood_depth", Prob), ("flood_level", Lambda)]
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

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )
        else:
            raise ValueError(
                f"Invalid distribution_type for flood model or failure_model is None for node '{node.name}' with description '{node.description}'")

    def fire_model(self, node, file):
        # Check if the node has the failure_model with distribution_type "FR"
        failure_model = node.failure_model
        if failure_model and failure_model.get("distribution_type") == "FL":
            # Define the parameters based on the provided criteria
            name = node.name  # assuming 'name' is an attribute of the 'Node' object
            FdT = "J"
            UdC = getattr(node, "correlation_set", "") or ""
            UdT = "S"

            # Check and retrieve values from failure_model, raising ValueError if any are None
            UdValue = failure_model.get("beta_r_uncertainty")
            Prob = failure_model.get("median_fire_severity")
            Lambda = failure_model.get("fire_severity")

            # Check for None values and raise ValueError with detailed error message
            if None in (UdValue, Prob, Lambda):
                error_params = [param for param, value in
                                [("beta_r_uncertainty", UdValue), ("median_fire_severity", Prob),
                                 ("fire_severity", Lambda)]
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

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )
        else:
            raise ValueError(
                f"Invalid distribution_type for fire model or failure_model is None for node '{node.name}' with description '{node.description}'")

    def beta_distribution_model(self, node, file):
        # Check if the node has the failure_model with distribution_type "B"
        failure_model = node.failure_model

        if failure_model and failure_model.get("distribution_type") == "B":
            # Define the parameters based on the provided criteria
            name = node.name  # assuming 'name' is an attribute of the 'Node' object
            FdT, UdC, UdT = "1", getattr(node, "correlation_set", "") or "", "B"

            # Check if UdValue is specified as 'beta' or 'variance'
            UdValue = failure_model.get("beta")

            if UdValue is None:
                # If UdValue is not specified, calculate beta from mean and variance
                mean, variance = failure_model.get("mean"), failure_model.get("variance")

                # Check for None values and raise ValueError with a detailed error message
                if None in (mean, variance):
                    error_params = [param for param, value in
                                    [("mean", mean), ("variance", variance)]
                                    if value is None]
                    raise ValueError(
                        f"Some parameters in failure_model are None for node '{name}' with description '{node.description}': {error_params}")

                # Calculate beta from mean and variance
                UdValue = mean / (variance * (1 - mean))

            # Define other parameters
            Prob, Lambda, Tau, Mission, Init, PF, UdValue2, Calc_Prob, Freq = (
                failure_model.get("mean"), "0.000E+000", "0.000E+000", "0.000E+000", "",
                "", "0.000E+000", "", ""
            )

            Analysis_Type, Phase_Type, Project = "RANDOM", "CD", "G-PWR"

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )
        else:
            raise ValueError(
                f"Invalid distribution_type for beta distribution model or failure_model is None for node '{node.name}' with description '{node.description}'")

    def value_event_model(self, node, file):
        if (
                node.failure_model
                and node.failure_model.get("id") == "V"
                and node.node_type == "ASFE"
        ):
            # Define the parameters based on the provided criteria
            name = node.name
            FdT = node.failure_model.get("id")
            UdC = "0.000E+000"
            UdT = ""
            UdValue = "0.000E+000"
            Prob = node.failure_model.get("value")
            Lambda = "0.000E+000"
            Tau = "0.000E+000"
            Mission = "0.000E+000"
            Init = ""
            PF = ""
            UdValue2 = "0.000E+000"
            Calc_Prob = node.failure_model.get("value")
            Freq = ""
            Analysis_Type = "RANDOM"
            Phase_Type = "CD"
            Project = "G-PWR"

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )
        else:
            raise ValueError("Invalid distribution_type for value event")

    def HRA_event_model(self, node, file):
        if (
                node.failure_model
                and node.failure_model.get("distribution_type") == "P"
                and node.node_type == "FLD_HRA" or node.node_type == "FIR_HRA"
        ):
            # Define the parameters based on the provided criteria
            name = node.name
            FdT = "1"
            UdC = "0.000E+000"
            UdT = ""
            UdValue = "0.000E+000"
            Prob = node.failure_model.get("prob")
            Lambda = "0.000E+000"
            Tau = "0.000E+000"
            Mission = "0.000E+000"
            Init = ""
            PF = ""
            UdValue2 = "0.000E+000"
            Calc_Prob = node.failure_model.get("prob")
            Freq = ""
            Analysis_Type = "RANDOM"
            Phase_Type = "CD"
            Project = "G-PWR"

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )
        else:
            raise ValueError("Invalid distribution_type for Point Value event")



    def point_value_event_model(self, node, file):
        if (
                node.failure_model
                and node.failure_model.get("distribution_type") == "P"
        ):

            # Define the parameters based on the provided criteria
            name = node.name
            FdT = "1"
            UdC = "0.000E+000"
            UdT = ""
            UdValue = "0.000E+000"
            Prob = node.failure_model.get("prop")
            Lambda = "0.000E+000"
            Tau = "0.000E+000"
            Mission = "0.000E+000"
            Init = ""
            PF = ""
            UdValue2 = "0.000E+000"
            Calc_Prob = node.failure_model.get("prop")
            Freq = ""
            Analysis_Type = "RANDOM"
            Phase_Type = "CD"
            Project = "G-PWR"

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )
        else:
            raise ValueError("Invalid distribution_type for Point Value event")


    def house_event_model(self, node, file):
        # Check if the node has the failure_model with distribution_type "SL"
        if node.failure_model and node.failure_model.get("state"):
            # Define the parameters based on the provided criteria
            name = node.name
            FdT = node.failure_model.get("state")
            UdC = "0.000E+000"
            UdT = ""
            UdValue =  "0.000E+000"
            Prob =  "0.000E+000"
            Lambda = "0.000E+000"
            Tau = "0.000E+000"
            Mission = "0.000E+000"
            Init = ""
            PF = ""
            UdValue2 = "0.000E+000"
            Calc_Prob = ""
            Freq = ""
            Analysis_Type = "RANDOM"
            Phase_Type = "CD"
            Project = "G-PWR"

            # Write the information to the file
            file.write(
                f"{name},{FdT},{UdC},{UdT},{UdValue},{Prob},{Lambda},{Tau},{Mission},{Init},{PF},{UdValue2},{Calc_Prob},{Freq},{Analysis_Type},{Phase_Type},{Project}\n"
            )
        else:
            raise ValueError("Invalid distribution_type for house event")

    def compound_event_information_model(self, node, file):

        if ( node.node_type == "ASCE"
        ):
            # Define the parameters based on the provided criteria
            name = node.name
            FdT = "C"
            UdC = getattr(node, "correlation_set", "") or ""
            UdT = "0"  # Change this to "T" for Flood distribution type
            UdValue = "0"
            Prob = "0"

            Lambda = "0.00E+0"
            Tau = "0.000E+000"
            Mission = "0.000E+000"
            Init = ""
            PF = ""
            UdValue2 = "0"
            Calc_Prob = "0"
            Freq = " "
            Analysis_Type = "RANDOM"
            Phase_Type = "CD"
            Project = "G-PWR"

            # Write the information to the file
            file.write(
                f"{name},         {FdT},   {UdC},   {UdT},  {UdValue},  {Prob},  {Lambda},  {Tau},  {Mission},  {Init},  {PF},  {UdValue2},  {Calc_Prob},  {Freq},  {Analysis_Type},  {Phase_Type}, {Project}\n"
            )
        else:
            raise ValueError("Invalid compound event")

    def write_bei_data(self, node, file):


        if node.node_type == "SBE":
            self.seismic_model(node, file)
        elif node.node_type == "HE":
            self.house_event_model(node, file)
        elif node.node_type == "ASCE":
            self.compound_event_information_model(node, file)
        elif node.node_type == "ASFE":
            self.value_event_model(node, file)
        elif node.node_type == "FLD_LN":
            self.flood_model(node, file)
        elif node.node_type == "FLD_HRA":
            self.HRA_event_model(node, file)
        elif node.node_type == "FIR_HRA":
            self.HRA_event_model(node, file)
        elif node.node_type == "FIR-DET":
            self.point_value_event_model(node,file)
        elif node.node_type == "FIR_SPR_RAND":
            self.point_value_event_model(node, file)
        elif node.node_type == "FIR-RAND":
            self.point_value_event_model(node, file)
        elif node.node_type == "FRBE":
            self.beta_distribution_model(node,file)
        elif node.node_type == "FIR_LN":
            self.fire_model(node,file)









