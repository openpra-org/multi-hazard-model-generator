import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import lognorm


class TwoRoomWaterFlow:
    def __init__(self, room1_area=30, room2_area=20, gap_area_default=0.005, gap_door_open=1, discharge_coefficient=0.9,
                 room1_height=4, room2_height=4, median_capacity=1, beta_r=0.5, beta_u=0.5):
        self.g = 9.81
        self.room1_area = room1_area
        self.room2_area = room2_area
        self.gap_area_default = gap_area_default
        self.gap_door_open = gap_door_open
        self.discharge_coefficient = discharge_coefficient
        self.room1_height = room1_height
        self.room2_height = room2_height
        self.median_capacity = median_capacity
        self.beta_r = beta_r
        self.beta_u = beta_u

    def source_flow_rate_room1(self, time):
        return 0.25 * np.exp(-0.005 * time)+0.05

    def source_flow_rate_room2(self, time):
        return 0.0000005 * time

    def door_fragility(self, water_level_room1):
        # Calculate fragility from log-normal distribution
        sigma = np.sqrt(self.beta_r ** 2 + self.beta_u ** 2)
        fragility = lognorm.cdf(water_level_room1, sigma, scale=self.median_capacity)
        sample = np.random.random()
        #print(fragility, sample, sample < fragility)
        # Random decision considering fragility
        return sample < fragility

    def gap_area(self, water_level_room1):
        if self.door_fragility(water_level_room1):
            return self.gap_door_open
        else:
            return self.gap_area_default

    def calculate_height_difference(self):
        return max(self.water_level_room1 - self.water_level_room2, 0)

    def calculate_leakage_outflow(self, water_level_room1):
        height_difference = self.calculate_height_difference()
        return self.discharge_coefficient * self.gap_area(water_level_room1) * np.sqrt(2 * self.g * height_difference)

    def simulate_once(self, duration, time_step=0.1):
        self.water_level_room1 = 0
        self.water_level_room2 = 0
        max_water_level_room1 = 0
        max_water_level_room2 = 0

        door_opened = False  # Flag to track if door fragility was triggered

        for time in np.arange(0, duration, time_step):
            source_flow_rate1 = self.source_flow_rate_room1(time)
            source_flow_rate2 = self.source_flow_rate_room2(time)

            # Check if door fragility was triggered previously and set gap area accordingly
            if door_opened:
                gap_area = self.gap_door_open
            else:
                gap_area = self.gap_area(self.water_level_room1)

            leakage_outflow = self.calculate_leakage_outflow(gap_area)

            water_level_room1_next = self.water_level_room1 + time_step * (
                    (source_flow_rate1 - leakage_outflow) / self.room1_area)
            water_level_room2_next = self.water_level_room2 + time_step * (
                    (source_flow_rate2 + leakage_outflow) / self.room2_area)

            self.water_level_room1 = max(0, min(water_level_room1_next, self.room1_height))
            self.water_level_room2 = max(0, min(water_level_room2_next, self.room2_height))

            max_water_level_room1 = max(max_water_level_room1, self.water_level_room1)
            max_water_level_room2 = max(max_water_level_room2, self.water_level_room2)

            # Check if fragility condition is triggered
            if not door_opened and self.door_fragility(self.water_level_room1):
                door_opened = True

        return max_water_level_room1, max_water_level_room2

    def simulate_multiple(self, iterations=250, duration=1000, time_step=0.1):
        max_levels_room1 = []
        max_levels_room2 = []

        for _ in range(iterations):
            max_level_room1, max_level_room2 = self.simulate_once(duration, time_step)
            max_levels_room1.append(max_level_room1)
            max_levels_room2.append(max_level_room2)

        return max_levels_room1, max_levels_room2


def plot_distribution(max_levels_room1, max_levels_room2):
    # Plot PDF and CDF for Room 1
    plt.figure(figsize=(14, 6))

    plt.subplot(1, 2, 1)
    plt.hist(max_levels_room1, bins=20, density=True, alpha=0.7, label='Room 1 PDF')
    plt.xlabel('Max Water Level (m)')
    plt.ylabel('Probability Density')
    plt.title('PDF of Max Water Level in Room 1')
    plt.legend()

    plt.subplot(1, 2, 2)
    sorted_data = np.sort(max_levels_room1)
    p = 1. * np.arange(len(max_levels_room1)) / (len(max_levels_room1) - 1)
    plt.plot(sorted_data, p, marker='.', linestyle='none', label='Room 1 CDF')
    plt.xlabel('Max Water Level (m)')
    plt.ylabel('Cumulative Probability')
    plt.title('CDF of Max Water Level in Room 1')
    plt.legend()

    plt.tight_layout()
    plt.show()

    # Plot PDF and CDF for Room 2
    plt.figure(figsize=(14, 6))

    plt.subplot(1, 2, 1)
    plt.hist(max_levels_room2, bins=20, density=True, alpha=0.7, label='Room 2 PDF')
    plt.xlabel('Max Water Level (m)')
    plt.ylabel('Probability Density')
    plt.title('PDF of Max Water Level in Room 2')
    plt.legend()

    plt.subplot(1, 2, 2)
    sorted_data = np.sort(max_levels_room2)
    p = 1. * np.arange(len(max_levels_room2)) / (len(max_levels_room2) - 1)
    plt.plot(sorted_data, p, marker='.', linestyle='none', label='Room 2 CDF')
    plt.xlabel('Max Water Level (m)')
    plt.ylabel('Cumulative Probability')
    plt.title('CDF of Max Water Level in Room 2')
    plt.legend()

    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    model = TwoRoomWaterFlow()
    duration = 200  # Duration of simulation in seconds
    time_step = 0.5  # Time step for simulation
    iterations = 100  # Number of simulation iterations
    max_levels_room1, max_levels_room2 = model.simulate_multiple(iterations=iterations, duration=duration,
                                                                 time_step=time_step)

    plot_distribution(max_levels_room1, max_levels_room2)