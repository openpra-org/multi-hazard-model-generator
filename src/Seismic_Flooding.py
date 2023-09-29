from imports import *


class Node:
    def __init__(self, logic_type, description, node_type,name):
        self.logic_type = logic_type
        self.description = description
        self.node_type = node_type
        self.name = name
        self.children = []


class TreeBuilder:
    def __init__(self):
        self.tree = None

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
        node = Node(logic_type, description, node_type, name)

        if "inputs" in node_data:
            inputs = node_data["inputs"]
            if isinstance(inputs, dict):
                input_node = self._build_node(inputs)
                if input_node:
                    node.children.append(input_node)
            elif isinstance(inputs, list):
                for input_node_data in inputs:
                    input_node = self._build_node(input_node_data)
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
        graph.write_png("seismic_flooding_fault_tree.png")
        img = Image.open("seismic_flooding_fault_tree.png")
        img.show()

    def print_tree(self, node=None, level=0):
        if node is None:
            return  # Exit the function if the node is None
        print(node)
        print("  " * level + f"Logic Type: {node.logic_type}, Description: {node.description}, Type: {node.node_type}")

        for child in node.children:
            self.print_tree(child, level + 1)

    def write_gtd(self, filename):
        """Write a .GTD file with gate descriptions"""
        # Get current file directory
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir, "..", "output", "general")

        # Create directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

        # Build full file path
        file_path = os.path.join(output_dir, filename)

        with open(file_path, 'w') as f:

            def collect_gates(node):
                if node.node_type == "GT":
                    f.write(f"{node.name},{node.description}, G-PWR\n")
                for child in node.children:
                    collect_gates(child)

            collect_gates(self.tree)

    def write_ftl(self, filename):
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct output directory
        output_dir = os.path.join(current_dir, "..", "output", "general")

        # Create directory if doesn't exist
        os.makedirs(output_dir, exist_ok=True)
        with open(os.path.join(output_dir, filename), 'w') as f:
            # Write root node name and =
            f.write(f" G-PWR,  {self.tree.name} =\n")
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




# Custom JSON Encoder to handle ObjectId
class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)  # Convert ObjectId to its string representation
        return super(JSONEncoder, self).default(o)



