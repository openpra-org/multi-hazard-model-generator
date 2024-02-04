import unittest
from Tsunami import TsunamiFaultTree  # Import your TsunamiFaultTree class


class TestTsunamiFaultTree(unittest.TestCase):
    def setUp(self):
        # Set up your TsunamiFaultTree instance with mock MongoDB data or use a test database
        self.tft = TsunamiFaultTree(mongodb_uri='mongodb+srv://akramsaid:Narcos99@myatlasclusteredu.nzilawl.mongodb.net/',
                                     general_input_db_name='MultiHazards_PRA_General',
                                     seismic_flooding_db_name='seismic_flooding_database')

    def test_create_gates_MWH_bin(self):
        # Mock data for testing
        pga_bin_num = 1
        mwh_bin_num = 1

        # Call the method and store the returned gate
        mwh_gate = self.tft.create_gates_MWH_bin(pga_bin_num, mwh_bin_num)
        print(mwh_gate)
        # Assert that the gate is not None
        self.assertIsNotNone(mwh_gate)

        # You can add more assertions here to test the correctness of the gate object


if __name__ == '__main__':
    unittest.main()
