from imports import *
from abc import ABC, abstractmethod

class BaseEvent(ABC):
    def __init__(self, event_description, phase_type, probability_parameters, event_name, project_name, analysis_type,
                 Lambda, tau, prob, mission, UdC, FdT, UdValue, UdValue2, init, PF, Freq, Tau, beta_u, beta_r, a_m, building, floor, elevation, area, count,
                 seismic_fire,seismic_flooding,peak_ground_accel,start_time,end_time):
        self.event_description = event_description
        self.phase_type = phase_type
        self.probability_parameters = probability_parameters
        self.event_name = event_name
        self.project_name = project_name
        self.analysis_type = analysis_type  #
        self.Lambda = Lambda  # Basic event failure rate per hr
        self.tau = tau  # Time to repair in hours
        self.prob = prob  # Probability value
        self.mission = mission  # Mission time
        self.UdC = UdC  # Uncertainty correlation class
        self.FdT = FdT  # Failure Calculation type
        self.UdValue = UdValue  # Uncertainty distribution value
        self.UdValue2 = UdValue2
        self.init = init  # Initiating event flag (Y/N)
        self.PF = PF  # Process Flag
        self.Freq = Freq  # Frequency Unit
        self.Tau = Tau

        self.beta_u = beta_u
        self.beta_r = beta_r
        self.a_m = a_m
        self.building = building
        self.floor = floor
        self.elevation = elevation
        self.area = area
        self.seismic_fire = seismic_fire
        self.seismic_flooding = seismic_flooding
        self.peak_ground_accel = peak_ground_accel
        self.count = count
        self.start_time = start_time
        self.end_time = end_time

    @abstractmethod
    def create_bed_file(self):
        pass

    @abstractmethod
    def create_bei_file(self):
        pass



    @classmethod
    @abstractmethod
    def from_input_file(cls, input_file):
        pass

    @classmethod
    @abstractmethod
    def from_csv(cls, csv_file):
        pass