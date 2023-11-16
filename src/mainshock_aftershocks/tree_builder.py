from src.imports import *
from basic_event_model import BasicEventWriter
from collections import deque

class Node:
    def __init__(self, logic_type, description, node_type,name,failure_model=None,library = None,procedure = None,id = None):
        self.logic_type = logic_type
        self.description = description
        self.node_type = node_type
        self.name = name
        self.failure_model = failure_model
        self.library = library
        self.procedure = procedure
        self.id = id

        self.children = []

    def add_child(self, child_node):
        self.children.append(child_node)


class TreeBuilder:
    def __init__(self):
        self.tree = None
        self.unique_gate_names = set()
        self.unique_ft_names = set()
        self.unique_BED_names = set()
        self.unique_BEI_names = set()
        self.g_pwr_written_ftd = False
        self.g_pwr_written_gtd = False

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
        id  = node_data.get("id")

        node = Node(logic_type, description, node_type, name, failure_model,libray,procedure,id)

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

    def convert_dict_to_tree(self, node_data):
        logic_type = node_data.get("logic_type")
        if logic_type is None or node_data.get("name") is None:
            return None

        description = node_data.get("description")
        node_type = node_data.get("type")
        name = node_data.get("name")
        failure_model = node_data.get("failure_model")
        library = node_data.get("library")
        procedure = node_data.get("procedure")
        id = node_data.get("id")

        node = Node(logic_type, description, node_type, name, failure_model, library, procedure, id)

        if "inputs" in node_data:
            inputs = node_data["inputs"]
            if isinstance(inputs, list):
                for input_node_data in inputs:
                    input_node = self.convert_dict_to_tree(input_node_data)
                    if input_node:
                        node.add_child(input_node)
            elif isinstance(inputs, dict):
                input_node = self.convert_dict_to_tree(inputs)
                if input_node:
                    node.add_child(input_node)

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

    def extract_subtree(self, tree, mongodb_uri=None, db_name=None):
        new_tree = TreeBuilder( )
        new_tree.tree = self._extract_subtree(tree.tree)
        return new_tree

    def _extract_subtree(self, node):
        if not node or (not node.children) or (node.node_type == "FT"):
            return Node(node_type=node.node_type, name=node.name)

        new_node = Node(
            node_type=node.node_type,
            name=node.name,
            logic_type=node.logic_type,
            description=node.description,
            failure_model=node.failure_model,
            library=node.library,
            procedure=node.procedure,
            id=node.id,
        )

        for child in node.children:
            new_child = self._extract_subtree(child)
            if new_child:
                new_node.children.append(new_child)

        return new_node

    def print_tree(self, node=None, level=0):
        if node is None:
            return  # Exit the function if the node is None
        print(node)
        print("  " * level + f"Logic Type: {node.logic_type}, Description: {node.description}, Type: {node.node_type}")

        for child in node.children:
            self.print_tree(child, level + 1)

    def write_gtd(self, file_name):
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
            # Check if "G-PWR =" has been written
            if not self.g_pwr_written_gtd:
                f.write("G-PWR  =\n")
                # Set the flag to True after writing
                self.g_pwr_written_gtd = True

            def collect_gates(node):
                if node.node_type == "GT":
                    if node.name not in self.unique_gate_names:
                        f.write(f"{node.name},{node.description}, , G-PWR\n")
                        self.unique_gate_names.add(node.name)
                for child in node.children:
                    collect_gates(child)

            collect_gates(self.tree)


    def write_ftd(self, file_name):
        """Append gate descriptions to an existing .GTD file"""
        # Get current file directory
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir, "output/MARD")

        # Fault tree file name
        filename = os.path.join(output_dir, file_name + '.FTD')
        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        # Build full file path
        file_path = os.path.join(output_dir, filename)

        with open(file_path, 'a') as f:
            # Check if "G-PWR  =" has been written
            if not self.g_pwr_written_ftd:
                f.write("G-PWR  =  \n")
                # Set the flag to True after writing
                self.g_pwr_written_ftd = True

            def collect_ft(node):
                if node.node_type == "FT":
                    if node.name not in self.unique_ft_names:
                        f.write(f"{node.name},{node.description} , , ,  , G-PWR\n")
                        self.unique_ft_names.add(node.name)
                for child in node.children:
                    collect_ft(child)

            collect_ft(self.tree)

    def write_ftl(self, file_name):
        current_dir = os.path.dirname(os.path.abspath(__file__))
        output_dir = os.path.join(current_dir, "output/MARD")
        filename = os.path.join(output_dir, file_name + '.FTL')

        ft_tree_file = "ft_tree_file.FTL"

        os.makedirs(output_dir, exist_ok=True)

        # Store the contents of ft_temp
        ft_temp_contents = None

        with open(os.path.join(output_dir, filename), 'w') as f, open(os.path.join(output_dir, ft_tree_file),
                                                                      'w') as ft_temp:
            first_node_name = self.tree.name
            f.write(f"G-PWR, {first_node_name} =\n")

            ft_queue = deque()
            fault_tree_dict = {}
            def traverse_node(node, file, is_ft=False):
                if is_ft:
                    file.write("^EOS\n")
                    file.write(f"G-PWR ,   {node.name}  = \n")
                file.write(f"{node.name}                      {node.logic_type}  ")
                file.write(" ".join(child.name for child in node.children))
                file.write("\n")

                for child in node.children:
                    if child.node_type == "FT":
                        file.write(f"{child.name}        TRAN\n")
                        if child.name not in fault_tree_dict:
                            ft_queue.append(child)
                            fault_tree_dict[child.name] = child

                    elif child.node_type == "GT":
                        traverse_node(child, file)

            traverse_node(self.tree, f, is_ft=False)

            while ft_queue:
                node = ft_queue.popleft()
                traverse_node(node, ft_temp, is_ft=True)

            ft_temp.write("^EOS\n")


        # Now, read the contents of ft_temp before it's closed
        with open(os.path.join(output_dir, ft_tree_file), 'r') as ft_temp:
            ft_temp_contents = ft_temp.read()

        # Now, write the contents of ft_temp_contents to f
        if ft_temp_contents:
            with open(os.path.join(output_dir, filename), 'a') as f:
                f.write(ft_temp_contents)

        # Remove temp file
        os.remove(os.path.join(output_dir, ft_tree_file))

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



