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

    def print_tree(self, node=None, level=0):
        if node is None:
            node = self.tree
        print("  " * level + f"ID: {node.id}, Name: {node.name}, Type: {node.type}")
        for child in node.children:
            self.print_tree(child, level + 1)

# Example JSON data
json_data = {
    "name": "FAILURE OF COMPONENT [ssc_name] DUE TO FLOODING",
    "type": "OR",
    "id": "FT",
    "inputs": [
        {
            "id": "BE",
            "type": "HRA",
            "name": "FAILURE OF OPERATOR ACTION TO PREVENT FLOODING OF [SSC_NAME]",
        },
        {
            "id": "OR_GT",
            "type": "OR",
            "name": "SOURCES OF SEISMIC INDUCED FLOODING",
            "inputs": [
                {
                    "name": "SEISMIC FAILURE OF COMPONENT [ssc_flood_name] CAUSING FLOODING",
                    "id": "seismic_FT",
                },
                {
                    "id": "BE",
                    "type": "RANDOM",
                    "name": "FAILURE OF COMPONENT [ssc_name] DUE TO RANDOM FLOOD FAILURE",
                },
            ],
        },
    ],
}


# Create instance of SeismicFloodingFaultTree
fault_tree = SeismicFloodingFaultTree()

# Build the tree
fault_tree.build_tree(json_data)

# Print the tree hierarchy with node information
fault_tree.print_tree()




                    
