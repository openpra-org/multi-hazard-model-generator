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
            UdC = ""
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
        elif node.node_type == "Flood-Failure":
            self.flood_model(node, file)
        elif node.node_type == "HE":
            self.house_event_model(node,file)
        elif node.node_type == "ASCE":
            self.compound_event_information_model(node,file)
        elif node .node_type == "ASFE":
            self.value_event_model(node,file)








