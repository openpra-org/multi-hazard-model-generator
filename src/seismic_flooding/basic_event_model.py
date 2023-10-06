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
            UdC = ""
            UdT = "S"
            UdValue = node.failure_model.get("beta_r_uncertainty", "")
            Prob = node.failure_model.get("median_seismic_acceleration", "")
            Lambda = ""
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
        if (
            node.failure_model
            and node.failure_model.get("distribution_type") == "FL"
        ):
            # Define the parameters based on the provided criteria
            name = node.name
            FdT = "J"
            UdC = ""
            UdT = "T"  # Change this to "T" for Flood distribution type
            UdValue = node.failure_model.get("beta_r_uncertainty", "")
            Prob = node.failure_model.get("median_flood_depth", "")  # Change this to "median_flood_depth"
            Lambda = ""
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
            raise ValueError("Invalid distribution_type for flood model")

    def HRA_model(self, node):
        # Write BEI for HRA model here
        pass


    def write_bei_data(self, node, file):
        if node.node_type == "Seismic-FT":
            self.seismic_model(node, file)
        elif node.node_type == "Flood-Failure":
            self.flood_model(node, file)
        # Add more conditions for other node types