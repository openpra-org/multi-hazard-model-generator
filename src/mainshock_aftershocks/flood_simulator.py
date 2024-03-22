import matplotlib.pyplot as plt
import numpy as np

class Room:
    def __init__(self, name, water_level=0.0, dimensions=(1.0, 1.0, 1.0)):
        self.name = name
        self.water_level = water_level  # in meters
        self.sources = []
        self.sinks = []
        self.length, self.width, self.height = dimensions  # Dimensions of the room (m)

    def add_source(self, source):
        self.sources.append(source)

    def add_sink(self, sink):
        self.sinks.append(sink)

    def update_water_level(self, inflow, outflow, time_step):
        # Calculate the volume of the room
        room_area = self.length * self.width

        # Update water level considering time step and room volume
        self.water_level += ((inflow - outflow) / room_area) * time_step



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

        # Check if water levels of adjacent rooms are close, turn off sink in room 1 if necessary
        if len(self.rooms) == 2:  # Assume only two rooms for simplicity
            room1, room2 = self.rooms
            if abs(room1.water_level - room2.water_level) < 0.1:
                # Turn off sink in room 1
                room1.sinks[0].sink_rate_func = lambda time: 0
                # Synchronize water levels of room A with room B
                room2_delta = room1.water_level - room2.water_level
                room2.water_level += room2_delta

        return simulation_continue

    def simulate_until_convergence(self, max_iterations=10000, convergence_threshold=0.0001, consecutive_iterations=10,
                                   time_step=1):
        time_steps = []
        consecutive_convergence_count = 0
        prev_water_levels = {room.name: float('inf') for room in self.rooms}  # Initialize with infinity for all rooms

        for _ in range(max_iterations):
            self.simulate_one_step(time_step)
            current_water_levels = {room.name: room.water_level for room in self.rooms}

            # Check convergence for each room
            room_convergence = [
                abs(prev_water_levels[room_name] - current_water_levels[room_name]) < convergence_threshold for
                room_name in prev_water_levels.keys()]

            if all(room_convergence):
                consecutive_convergence_count += 1
            else:
                consecutive_convergence_count = 0

            if consecutive_convergence_count >= consecutive_iterations:
                break

            prev_water_levels = current_water_levels.copy()  # Update previous water levels

        # Record time steps
        time_steps = [i * time_step for i in range(len(self.water_levels[self.rooms[0].name]))]

        return time_steps

    def plot_water_level(self, time_steps):
        # Increase font sizes and make them bold
        plt.xlabel('Time (seconds)', fontsize=14, fontweight='bold')
        plt.ylabel('Water Level (meters)', fontsize=14, fontweight='bold')
        plt.title('Water Level Evolution in Rooms', fontsize=16, fontweight='bold')

        for room_name, water_levels in self.water_levels.items():
            plt.plot(time_steps, water_levels, label=room_name)
        plt.legend()
        plt.grid(True)
        plt.show()


# Define dynamic flow rate and sink rate functions
def dynamic_flow_rate(time):
    # Define time-dependent flow rate (example: increasing over time)
    return 0.250 * np.exp(-time * 0.01)

def dynamic_sink_rate(time):
    # Define time-dependent sink rate
    if time < 200:
        return 0.01  # Before 250 seconds, sink rate is constant
    else:
        return 0.1+0.1*np.exp(-0.005*time)  # After 250 seconds, sink rate increases

# Example Usage
room1 = Room("Room B -Floor 1", water_level=0.2, dimensions=(3, 3, 4))
room1.add_source(WaterSource(flow_rate_func=dynamic_flow_rate))
room1.add_sink(Sink(sink_rate_func=dynamic_sink_rate))

# Define another room adjacent to the first one
room2 = Room("Room A -Floor 1", water_level=0.0, dimensions=(3, 3, 4))
room2.add_source(WaterSource(flow_rate_func=lambda time: room1.sinks[0].calculate_sink(time)))  # Set inflow from room1's sink

rooms = [room1, room2]
simulation = Simulation(rooms)
time_steps = simulation.simulate_until_convergence(time_step=5)  # Adjust time step as needed
simulation.plot_water_level(time_steps)
