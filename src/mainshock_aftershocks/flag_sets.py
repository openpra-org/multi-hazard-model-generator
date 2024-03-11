from src.imports import *

class FlagSetWriter:
    def __init__(self, mongodb_uri, general_input_db_name):
        self.client = MongoClient(mongodb_uri)
        self.db = self.client[general_input_db_name]
        self.general_input = self.db["General_Input"]
        self.flag_sets = self.db["flag_sets"]

    def write_csa(self, file_name, output_directory):
        output_dir = os.path.join(output_directory, "MARD_flag")

        file_path = os.path.join(output_dir, file_name+".CSA")
        with open(file_path, 'w') as f:
            # Write comment line
            f.write("* CS primary name                                , Change set alterante name   					,C = change set , F = flag set  ,   , project name\n")

            # Get total number of flag sets
            total_flag_sets = self.flag_sets.count_documents({})

            # Iterate through flag_set documents
            for i, flag_set in enumerate(self.flag_sets.find()):
                # Write flag_set details
                f.write(f"{flag_set['flag_name']}                                       , {flag_set['flag_name']}                                       , F,  , {flag_set['project_name']}\n")

                # Write ^EOS if it's not the last flag set
                if i < total_flag_sets - 1:
                    f.write("^EOS\n")

    def write_csd(self, file_name, output_directory):
        # Find the General_Input document with "id" equal to "GID"
        general_input_document = self.general_input.find_one({"id": "GID"})

        # Extract the project name from the General_Input document
        project_name = general_input_document.get("Analysis", {}).get("project", "")

        output_dir = os.path.join(output_directory, "MARD_flag")

        file_path = os.path.join(output_dir, file_name+".CSD")
        with open(file_path, 'w') as f:
            # Write header line with the dynamically obtained project name
            f.write(
                f"{project_name}=\n* change set primary name , change set description, change set alternate description , project name\n")

            # Iterate through flag_set documents
            for flag_set in self.flag_sets.find():
                # Write flag_set details
                f.write(f"{flag_set['flag_name']},{flag_set['flag_description']},,{flag_set['project_name']}\n")

    def write_csi(self, file_name, output_directory):
        output_dir = os.path.join(output_directory, "MARD_flag")
        file_path = os.path.join(output_dir, file_name +".CSI")
        with open(file_path, 'w') as f:
            # Write project name and change set primary name
            # Iterate through flag_set documents
            for flag_set in self.flag_sets.find():
                project_name = flag_set.get('project_name', '')
                flag_name = flag_set.get('flag_name', '')
                analysis_type = flag_set.get('analysis_type', 'RANDOM')
                phase_type = flag_set.get('phase_type', 'CD')

                f.write(f"{project_name} , {flag_name}                                         =\n")

                # Write ^PROBABILITY section
                f.write("^PROBABILITY\n")
                for i, event in enumerate(flag_set['events']):
                    change_rule = flag_set['change_rules'][i]
                    f.write(f"{event}                                            , {change_rule}, , , , , , , , , , {analysis_type}, {phase_type}\n")

                # Write ^CLASS section
                f.write("^CLASS\n")

                # Check if it's not the last iteration
                if flag_set != self.flag_sets.find()[self.flag_sets.count_documents({}) - 1]:
                    f.write("^EOS\n")

    def main(self,current_dir):
        # Define file names and output directory
        file_name_csa = "csa_file.CSA"
        file_name_csd = "csd_file.CSD"
        file_name_csi = "csi_file.CSI"
        output_directory =os.path.join(current_dir,'output')

        # Write CSA, CSD, and CSI files
        self.write_csa(file_name_csa, output_directory)
        self.write_csd(file_name_csd, output_directory)
        self.write_csi(file_name_csi, output_directory)


if __name__ == "__main__":
    # Convert MongoDB flag set data to SAPHIRE MAR-D
    mongodb_uri = 'mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/'
    db_name = 'MultiHazards_PRA_General'


    flag_set_writer = FlagSetWriter(mongodb_uri, db_name)
    flag_set_writer.main()