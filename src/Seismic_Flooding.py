from imports import *
from base_fault import BaseFaultTree

class Node:
    def __init__(self, id, name, type):
        self.id = id
        self.name = name
        self.type = type
        self.children = []

class SeismicFloodingFaultTree:
    def __init__(self):
        self.tree = None

    def build_tree(self, data):
        self.tree = self._build_node(data)

    def _build_node(self, node_data):
        node = Node(node_data.get("id"), node_data.get("name"), node_data.get("type"))
        if "inputs" in node_data:
            inputs = node_data["inputs"]
            if isinstance(inputs, dict):
                input_node = self._build_node(inputs)
                node.children.append(input_node)
            elif isinstance(inputs, list):
                for input_node_data in inputs:
                    input_node = self._build_node(input_node_data)
                    node.children.append(input_node)
        return node

    def create_graph(self, node=None, graph=None):
        if node is None:
            node = self.tree
        if graph is None:
            graph = pydot.Dot(graph_type="digraph")

        if node.id == "BE":
            node_shape = "octagon"
            node_width = 0.2  # Adjust the width as needed
            node_height = 0.2  # Adjust the height as needed
        elif node.id == "OR":
            node_shape = "hexagon"
            node_width = 1.0  # Adjust the width as needed
            node_height = 1.0  # Adjust the height as needed
        elif node.id == "AND":
            node_shape = "rectangle"
            node_width = 1.5  # Adjust the width as needed
            node_height = 0.75  # Adjust the height as needed
        else:
            node_shape = "rectangle"
            node_width = 1.0  # Default width for other nodes
            node_height = 0.5  # Default height for other nodes

        graph.add_node(pydot.Node(node.name, label=node.name, shape=node_shape, width=node_width, height=node_height))

        for child in node.children:
            graph.add_edge(pydot.Edge(node.name, child.name))
            self.create_graph(child, graph)
        return graph

    def visualize_tree(self):
        graph = self.create_graph()
        graph.write_png("seismic_flooding_fault_tree.png")

        # Display the image using PIL (Python Imaging Library)
        img = Image.open("seismic_flooding_fault_tree.png")
        img.show()


    def print_tree(self, node=None, level=0):
        if node is None:
            node = self.tree
        print("  " * level + f"ID: {node.id}, Name: {node.name}, Type: {node.type}")
        for child in node.children:
            self.print_tree(child, level + 1)






# Construct the path to the JSON input file
current_dir = os.path.dirname(os.path.abspath(__file__))
json_filename = "flood_ft.json"
json_file_path = os.path.join(current_dir, "..", "inputs", json_filename)

# Read the JSON input from the file
with open(json_file_path, "r") as json_file:
    json_data = json.load(json_file)

# Create instance of SeismicFloodingFaultTree
fault_tree = SeismicFloodingFaultTree()

# Build the tree
fault_tree.build_tree(json_data)

# Print the tree hierarchy with node information
fault_tree.print_tree()

# Visualize the tree
fault_tree.visualize_tree()



                    
