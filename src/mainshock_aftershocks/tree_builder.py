from src.imports import *
from basic_event_model import BasicEventWriter

class Node:
    def __init__(self, logic_type, description, node_type,name,failure_model=None,library = None,procedure = None):
        self.logic_type = logic_type
        self.description = description
        self.node_type = node_type
        self.name = name
        self.failure_model = failure_model
        self.library = library
        self.procedure = procedure

        self.children = []


class TreeBuilder:
    def __init__(self,mongodb_uri,db_name):
        self.tree = None
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[db_name]
        self.general_input_collection = self.db["General_Input"]
        self.unique_gate_names = set()
        self.unique_ft_names = set()
        self.unique_BED_names = set()
        self.unique_BEI_names = set()

    def build_tree(self, data):
        self.tree = self._build_node(data)

    def _build_node(self, node_data):
        logic_type = node_data.get("logic_type")

        # Check if logic_type is None or name is None, and if so, return None to ignore this node
        if logic_type is None or node_data.get("name") is None:
            return None

        description = node_data.get("description")
        node_type = node_data.get("type")
        name = node_data.get("name")
        failure_model = node_data.get("failure_model")  # Failure model is optional
        libray = node_data.get("library")
        procedure = node_data.get("procedure")

        node = Node(logic_type, description, node_type, name, failure_model,libray,procedure)

        if "inputs" in node_data:
            inputs = node_data["inputs"]
            if isinstance(inputs, list):
                for input_node_data in inputs:
                    if isinstance(input_node_data, list):
                        # Handle nested lists
                        for nested_input_node_data in input_node_data:
                            input_node = self._build_node(nested_input_node_data)
                            if input_node:
                                node.children.append(input_node)
                    else:
                        input_node = self._build_node(input_node_data)
                        if input_node:
                            node.children.append(input_node)
            elif isinstance(inputs, dict):
                input_node = self._build_node(inputs)
                if input_node:
                    node.children.append(input_node)

        return node

    def create_graph(self, node=None, graph=None, added_edges=None):
        if node is None:
            node = self.tree
        if graph is None:
            graph = pydot.Dot(graph_type="digraph")
        if added_edges is None:
            added_edges = set()

        if node.logic_type == "BE":
            node_shape = "octagon"
            node_width = 0.2
            node_height = 0.2
        elif node.logic_type == "OR":
            node_shape = "hexagon"
            node_width = 1.0
            node_height = 1.0
        elif node.logic_type == "AND":
            node_shape = "rectangle"
            node_width = 1.5
            node_height = 0.75
        else:
            node_shape = "rectangle"
            node_width = 1.0
            node_height = 0.5

        graph.add_node(pydot.Node(node.description, label=node.description, shape=node_shape, width=node_width,
                                  height=node_height))

        for child in node.children:
            if child is not None:  # Check if child is not None
                edge_description = f"{node.description}->{child.description}"
                if edge_description not in added_edges:
                    graph.add_edge(pydot.Edge(node.description, child.description))
                    added_edges.add(edge_description)  # Add the edge to the set
                    self.create_graph(child, graph, added_edges)
        return graph

    def visualize_tree(self):
        graph = self.create_graph()
        graph.write_png("seismic_fire_fault_tree.png")
        img_path = os.path.abspath("seismic_fire_fault_tree.png")
        img = Image.open(img_path)
        img.show()

    def print_tree(self, node=None, level=0):
        if node is None:
            return  # Exit the function if the node is None
        print(node)
        print("  " * level + f"Logic Type: {node.logic_type}, Description: {node.description}, Type: {node.node_type}")

        for child in node.children:
            self.print_tree(child, level + 1)

    def write_gtd(self,file_name):
        """Append gate descriptions to an existing .GTD file"""
        # Get current file directory
        current_dir = os.path.dirname(os.path.abspath(__file__))
        # Gate file name
        filename = 'seismic.GTD'

        # Construct output directory
        output_dir = os.path.join(current_dir, "output/MARD")

        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        # Build full file path
        file_path = os.path.join(output_dir, file_name + '.GTD')

        with open(file_path, 'a') as f:

            def collect_gates(node):
                if node.node_type == "GT":
                    if node.name not in self.unique_gate_names:
                        f.write(f"{node.name},{node.description}, G-PWR\n")
                        self.unique_gate_names.add(node.name)
                for child in node.children:
                    collect_gates(child)

            collect_gates(self.tree)


    def write_ftd(self,file_name):
        """Append gate descriptions to an existing .GTD file"""
        # Get current file directory
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir,  "output/MARD")


        # fault tree file name
        filename = os.path.join(output_dir, file_name + '.FTD')
        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        # Build full file path
        file_path = os.path.join(output_dir, filename)

        with open(file_path, 'a') as f:

            def collect_ft(node):
                if node.node_type == "FT":
                    if node.name not in self.unique_ft_names:
                        f.write(f"{node.name},{node.description},S , ,G-PWR\n")
                        self.unique_ft_names.add(node.name)
                for child in node.children:
                    collect_ft(child)

            collect_ft(self.tree)

    def write_ftl(self,file_name):
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir, "output/MARD")

        filename = os.path.join(output_dir, file_name + '.FTL')
        ft_tree_file = "ft_tree_file.FTL"
        ft_temp_path = os.path.join(output_dir, ft_tree_file)

        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        with open(os.path.join(output_dir, filename), 'w') as main_file, \
             open(ft_temp_path, 'w') as ft_temp:

            first_node_name = self.tree.name
            main_file.write(f"G-PWR, {first_node_name} =\n")

            def write_node(node, has_ft_parent=False, is_root_node=False):
                nonlocal ft_temp

                if node.node_type in ("FT", "GT"):

                    if (node.node_type == "FT" and not is_root_node) or (has_ft_parent and not is_root_node):
                        if node.node_type == "FT":
                            if has_ft_parent:
                                ft_temp.write(f"{node.name}        TRAN\n")
                            else:
                                main_file.write(f"{node.name}        TRAN\n")
                            ft_temp.write("^EOS\n")



                        curr_file = ft_temp
                        has_ft_parent = True
                    else:
                        curr_file = main_file
                        has_ft_parent = False
                    curr_file.write(f"G-PWR, {node.name} =\n")
                    curr_file.write(f"{node.name}                      ")
                    curr_file.write(f"{node.logic_type}  ")
                    curr_file.write('     '.join(child.name for child in node.children))
                    curr_file.write("\n")

                    for child in node.children:
                        write_node(child, has_ft_parent=has_ft_parent, is_root_node=False)

            write_node(self.tree, is_root_node=True)

            # close, save, and copy temp_ft to main file f
            ft_temp.write("^EOS\n")

            # Copy temp_ft to main file
            ft_temp.close()  # Close ft_temp after writing
            with open(ft_temp_path, 'r') as ft_temp_read:
                main_file.writelines(ft_temp_read.readlines())

        # Remove temp_ft
        os.remove(ft_temp_path)
    def write_bed(self,file_name):
        """Append Basic Event Descriptions (BED) to an existing file for nodes with logic_type == 'BE'"""
        current_dir = os.path.dirname(os.path.abspath(__file__))
        output_dir = os.path.join(current_dir, "output/MARD")
        os.makedirs(output_dir, exist_ok=True)
        file_path = os.path.join(output_dir, file_name + '.BED')

        with open(file_path, 'a') as f:  # Change 'w' to 'a' for appending

            def collect_nodes(node):
                if node.logic_type == "BE":
                    if node.name not in self.unique_BED_names:
                        f.write(f"{node.name},{node.description}, PWR\n")
                        self.unique_BED_names.add(node.name)
                for child in node.children:
                    collect_nodes(child)

            collect_nodes(self.tree)

    def write_bei(self,file_name):
        """Append Basic Event Descriptions (BED) to an existing file for nodes with logic_type == 'BE'"""
        current_dir = os.path.dirname(os.path.abspath(__file__))
        output_dir = os.path.join(current_dir, "output/MARD")
        os.makedirs(output_dir, exist_ok=True)

        file_path = os.path.join(output_dir, file_name + '.BEI')

        # Create an instance of BasicEventWriter
        bei_writer = BasicEventWriter()

        with open(file_path, 'a') as f:  # Change 'w' to 'a' for appending

            def collect_nodes(node):
                if node.logic_type == "BE":
                    if node.name not in self.unique_BEI_names:
                        print(node.node_type)
                        # Call write_bei_data method with file and node arguments
                        bei_writer.write_bei_data(node, f)

                        self.unique_BEI_names.add(node.name)
                for child in node.children:
                    collect_nodes(child)

            collect_nodes(self.tree)

    def write_bec(self,file_name):
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir, "output/MARD")


        bec_file = os.path.join(output_dir, file_name + '.BEC')

        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        with open(bec_file, 'a') as bec_file:
            def write_node(node, first_child=True):
                if node.node_type == "ASCE":
                    bec_file.write(
                        f"{node.name}                        , 0, COM, {node.library}, {node.procedure},RANDOM                                          , CD                                              , G-PWR\n")
                    for i, child in enumerate(node.children):
                        if i == len(node.children) - 1:
                            # If it's the last child, don't write a comma
                            bec_file.write(f"{child.name} ")
                        else:
                            bec_file.write(f"{child.name}, ")

                    bec_file.write("\n^EOS\n")
                else:
                    for i, child in enumerate(node.children):
                        # Pass False for the first child, and True for the subsequent ones
                        write_node(child, first_child=i == 0)

            write_node(self.tree)

    def write_mard(self, file_name):
        output_dir = "output"
        MARD_dir = "MARD"
        # List of filenames corresponding to the methods
        filenames = [file_name + ext for ext in ['.GTD', '.FTD', '.BED', '.BEI', '.FTL', '.BEC']]

        # Writing filenames to output/seismic.MARD
        with open(os.path.join(output_dir, file_name + '.MARD'), 'w') as mard_file:
            for filename in filenames:
                mard_file.write(os.path.join(MARD_dir, filename) + '\n')

        # Calling other methods
        self.write_gtd(file_name)
        self.write_ftd(file_name)
        self.write_bed(file_name)
        self.write_bei(file_name)
        self.write_ftl(file_name)
        self.write_bec(file_name)


# Custom JSON Encoder to handle ObjectId
class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)  # Convert ObjectId to its string representation
        return super(JSONEncoder, self).default(o)



