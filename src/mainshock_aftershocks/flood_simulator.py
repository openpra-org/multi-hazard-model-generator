import matplotlib.pyplot as plt
import math
import numpy as np

class Room:
    def __init__(self, name, water_level=0.0,height=float('inf')):
        self.name = name
        self.water_level = water_level  # in meters
        self.sources = []
        self.sinks = []
        self.height = height  # Maximum height water can reach within the room

    def add_source(self, source):
        self.sources.append(source)

    def add_sink(self, sink):
        self.sinks.append(sink)

    def update_water_level(self, inflow, outflow, time_step):
        # Update water level considering time step
        self.water_level += (inflow - outflow) * time_step  # m³/s * s = m³


class WaterSource:
    def __init__(self, flow_rate_func):
        self.flow_rate_func = flow_rate_func  # function: time -> flow rate (m³/s)

    def calculate_flow(self, time):
        return self.flow_rate_func(time)  # m³/s


class Sink:
    def __init__(self, sink_rate_func):
        self.sink_rate_func = sink_rate_func  # function: time -> sink rate (m³/s)

    def calculate_sink(self, time):
        return self.sink_rate_func(time)  # m³/s


class Simulation:
    def __init__(self, rooms):
        self.rooms = rooms
        self.current_time = 0  # Initialize simulation time
        self.water_levels = {room.name: [] for room in rooms}

    def simulate_one_step(self, time_step):
        simulation_continue = True  # Initially assume simulation should continue
        for room in self.rooms:
            total_inflow = sum(source.calculate_flow(self.current_time) for source in room.sources)
            total_outflow = sum(sink.calculate_sink(self.current_time) for sink in room.sinks)
            room.update_water_level(total_inflow, total_outflow, time_step)

            # Check if the water level exceeds room height or goes below zero
            if room.water_level >= room.height or room.water_level < 0:
                if room.water_level >= room.height:
                    room.water_level = room.height  # Cap the water level at room height
                else:
                    room.water_level = 0  # Set water level to zero if it goes below zero
                simulation_continue = False  # Signal to stop the simulation

            self.water_levels[room.name].append(room.water_level)

        self.current_time += time_step  # Update the simulation time
        return simulation_continue  # Return the status of whether to continue the simulation

    def simulate_until_stable(self, max_iterations=10000, tolerance=0.01, time_step=1):
        time_steps = []
        for _ in range(max_iterations):
            prev_water_levels = [room.water_level for room in self.rooms]
            simulation_continue = self.simulate_one_step(time_step)
            current_water_levels = [room.water_level for room in self.rooms]

            # Check if water levels have stabilized or simulation should stop
            if (not simulation_continue) or all(abs(prev - current) < tolerance for prev, current in zip(prev_water_levels, current_water_levels)):
                break

            time_steps.append(self.current_time)  # Record time step

        # Ensure time_steps and water_levels have the same length
        for room_name, water_levels in self.water_levels.items():
            self.water_levels[room_name] = water_levels[:len(time_steps)]

        return time_steps  # Return time steps for plotting

    def plot_water_level(self, time_steps):
        for room_name, water_levels in self.water_levels.items():
            plt.plot(time_steps, water_levels, label=room_name)
        plt.xlabel('Time (seconds)')
        plt.ylabel('Water Level (meters)')
        plt.title('Water Level Evolution in Rooms')
        plt.legend()
        plt.grid(True)
        plt.show()

# Define dynamic flow rate and sink rate functions
def dynamic_flow_rate(time):
    # Define time-dependent flow rate (example: increasing over time)
    return 0.01*np.exp(-time*0.03)

def dynamic_sink_rate(time):
    # Define time-dependent sink rate
    if time < 250:
        return 0.0005  # Before 250 seconds, sink rate is constant
    else:
        return 0.01  # After 250 seconds, sink rate increases


# Example Usage
room1 = Room("Room B -Floor 1", water_level=0.0,height=4)
room1.add_source(WaterSource(flow_rate_func=dynamic_flow_rate))
room1.add_sink(Sink(sink_rate_func=dynamic_sink_rate))

rooms = [room1]
simulation = Simulation(rooms)
time_steps = simulation.simulate_until_stable(time_step=40)  # Assume 1 minute time step
simulation.plot_water_level(time_steps)