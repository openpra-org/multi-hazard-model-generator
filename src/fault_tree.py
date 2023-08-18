from imports import *
from base_fault import BaseFaultTree


class FaultTree(BaseFaultTree):
    def create_ftl_file(self, output_directory, bec_event_names):
        file_path = os.path.join(output_directory, "fault_tree.ftl")  # FTL file path

        content = "FAULT TREE LOGIC:\n"
        for event_name in bec_event_names:
            content += f"  {event_name}, X, 1\n"
        content += "^EOF\n"

        self.write_file(file_path, content)

    def create_ftd_file(self, output_directory, bec_event_names):
        file_path = os.path.join(output_directory, "fault_tree.ftd")  # FTD file path

        content = "FAULT TREE DESCRIPTION:\n"
        for event_name in bec_event_names:
            content += f"  {event_name}, 0, 0, 1\n"
        content += "^EOF\n"

        self.write_file(file_path, content)