from src.imports import *
from basic_event_model import BasicEventWriter

class Node:
    def __init__(self, logic_type, description, node_type,name,failure_model=None):
        self.logic_type = logic_type
        self.description = description
        self.node_type = node_type
        self.name = name
        self.failure_model = failure_model

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

        node = Node(logic_type, description, node_type, name, failure_model)

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

    def write_gtd(self):
        """Append gate descriptions to an existing .GTD file"""
        # Get current file directory
        current_dir = os.path.dirname(os.path.abspath(__file__))
        # Gate file name
        filename = 'seismic_induced_fire.GTD'

        # Construct output directory
        output_dir = os.path.join(current_dir, "output")

        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        # Build full file path
        file_path = os.path.join(output_dir, filename)

        with open(file_path, 'a') as f:

            def collect_gates(node):
                if node.node_type == "GT":
                    if node.name not in self.unique_gate_names:
                        f.write(f"{node.name},{node.description}, G-PWR\n")
                        self.unique_gate_names.add(node.name)
                for child in node.children:
                    collect_gates(child)

            collect_gates(self.tree)


    def write_ftd(self):
        """Append gate descriptions to an existing .GTD file"""
        # Get current file directory
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir,  "output")

        # fault tree file name
        filename = 'seismic_induced_fire.FTD'
        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        # Build full file path
        file_path = os.path.join(output_dir, filename)

        with open(file_path, 'a') as f:

            def collect_ft(node):
                if node.node_type == "FT":
                    if node.name not in self.unique_ft_names:
                        f.write(f"{node.name},{node.description}, G-PWR\n")
                        self.unique_ft_names.add(node.name)
                for child in node.children:
                    collect_ft(child)

            collect_ft(self.tree)
    def write_ftl(self):
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir,  "output")

        filename = 'seismic_induced_fire.FTL'


        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)
        with open(os.path.join(output_dir, filename), 'a') as f:
            first_node_name = self.tree.name

            f.write(f"G-PWR, {first_node_name} =\n")
            def write_node(node):
                if node.node_type == "seismic_FT":
                    f.write(f"{node.name}                           TRAN\n")
                elif node.node_type in ("FT", "GT"):
                    f.write(f"{node.name}                      ")
                    f.write(f"{node.logic_type}  ")
                    for child in node.children:
                        f.write(f"{child.name}     ")
                    f.write("\n")
                    for child in node.children:
                        write_node(child)

            write_node(self.tree)

    def write_bed(self):
        """Append Basic Event Descriptions (BED) to an existing file for nodes with logic_type == 'BE'"""
        current_dir = os.path.dirname(os.path.abspath(__file__))
        output_dir = os.path.join(current_dir, "output")
        os.makedirs(output_dir, exist_ok=True)
        filename = 'seismic.BED'
        file_path = os.path.join(output_dir, filename)

        with open(file_path, 'a') as f:  # Change 'w' to 'a' for appending

            def collect_nodes(node):
                if node.logic_type == "BE":
                    if node.name not in self.unique_BED_names:
                        f.write(f"{node.name},{node.description}, PWR\n")
                        self.unique_BED_names.add(node.name)
                for child in node.children:
                    collect_nodes(child)

            collect_nodes(self.tree)

    def write_bei(self):
        """Append Basic Event Descriptions (BED) to an existing file for nodes with logic_type == 'BE'"""
        current_dir = os.path.dirname(os.path.abspath(__file__))
        output_dir = os.path.join(current_dir, "output")
        os.makedirs(output_dir, exist_ok=True)
        filename = 'seismic.BEI'
        file_path = os.path.join(output_dir, filename)

        # Create an instance of BasicEventWriter
        bei_writer = BasicEventWriter()

        with open(file_path, 'a') as f:  # Change 'w' to 'a' for appending

            def collect_nodes(node):
                if node.logic_type == "BE":
                    if node.name not in self.unique_BEI_names:
                        # Call write_bei_data method with file and node arguments
                        bei_writer.write_bei_data(node, f)
                        self.unique_BEI_names.add(node.name)
                for child in node.children:
                    collect_nodes(child)

            collect_nodes(self.tree)

    def write_mard(self):

        self.write_gtd()
        self.write_ftd()
        self.write_ftl()
        self.write_bed()
        self.write_bei()

# Custom JSON Encoder to handle ObjectId
class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)  # Convert ObjectId to its string representation
        return super(JSONEncoder, self).default(o)



