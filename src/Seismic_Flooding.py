from imports import *
from base_fault import BaseFaultTree


class Node:
    def __init__(self, logic_type, name, node_type):
        self.logic_type = logic_type
        self.name = name
        self.node_type = node_type
        self.children = []


class SeismicFloodingFaultTree:
    def __init__(self):
        self.tree = None

    def build_tree(self, data):
        self.tree = self._build_node(data)

    def _build_node(self, node_data):
        logic_type = node_data.get("logic_type")
        name = node_data.get("name")
        node_type = node_data.get("type")
        node = Node(logic_type, name, node_type)

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

        graph.add_node(pydot.Node(node.name, label=node.name, shape=node_shape, width=node_width, height=node_height))

        for child in node.children:
            graph.add_edge(pydot.Edge(node.name, child.name))
            self.create_graph(child, graph)
        return graph

    def visualize_tree(self):
        graph = self.create_graph()
        graph.write_png("seismic_flooding_fault_tree.png")
        img = Image.open("seismic_flooding_fault_tree.png")
        img.show()

    def print_tree(self, node=None, level=0):
        if node is None:
            node = self.tree
        print("  " * level + f"Logic Type: {node.logic_type}, Name: {node.name}, Type: {node.node_type}")
        for child in node.children:
            self.print_tree(child, level + 1)






# Construct the path to the JSON input file
current_dir = os.path.dirname(os.path.abspath(__file__))
json_filename = "flood_ft_propagation.json"
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



                    
