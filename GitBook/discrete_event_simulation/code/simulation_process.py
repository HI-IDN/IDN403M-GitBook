import random
from typing import List
import numpy as np
from collections import namedtuple
from simulation_data_processor import SimulationDataProcessor

ENTRY = "Koma"
EXIT = "Fara"
ARRIVAL = "Nýr kúnni"

BUSY = True
AVAILABLE = False

# Define the Event named tuple
Event = namedtuple('Event', ['station', 'simtime', 'direction'])


class SimulationProcess:
    """
    Class to handle the simulation process based on discrete events.
    """

    def __init__(self, simulation_data_processor, max_time: float):
        """
        Initialize the simulation with mean values, probabilities, and max simulation time.

        :param simulation_data_processor: Instance of SimulationDataProcessor.
        :param max_time: Maximum simulation time.
        """
        self.mean_values = simulation_data_processor.mean_values
        """ Mean values for each station, used for exponential distribution. """

        self.incoming_prob = simulation_data_processor.incoming_prob
        """ Probabilities for determining the next arrival direction. """

        self.max_time = max_time
        """ Maximum simulation time. Stop the simulation when this time is reached. """

        self.simtime = 0
        """ Current simulation time """
        self.last_simtime = 0
        """ Last simulation time, used for calculating statistics """

        self.events = []
        """ List of scheduled events, represented as Event named tuples """

        self.stations = simulation_data_processor.stations
        """ List of station names """

        self.queues = {station: 0 for station in self.stations}
        """ Queues for each station, number of customers waiting """

        self.workstations = {station: AVAILABLE for station in self.stations}
        """ Workstation availability, False = available, True = busy """

        self.stats = {
            "queues": {station: 0 for station in self.stations},
            "utilization": {station: 0 for station in self.stations},
            "customers": 0  # Initialize customer count to 0
        }
        """ Dictionary to store simulation statistics """

    @staticmethod
    def sort_by_simtime(events: List[Event]) -> List[Event]:
        """
        Sort a list of events by their simulation time.

        :param events: List of Event named tuples to sort.
        :return: Sorted list of Event named tuples.
        """
        # TODO: Implement sorting logic
        raise NotImplementedError("Event sorting not yet implemented.")

    @staticmethod
    def expon(mean: float) -> float:
        """
        Custom random number generator for exponential distribution, equivalent to Python's
        built-in random.expovariate(1/mean).

        :param mean: Mean of the exponential distribution.
        :return: Random number from the exponential distribution.
        """
        # TODO: Implement exponential random number generator
        raise NotImplementedError("Exponential random number generator not yet implemented.")

    def timing(self):
        """ Set the simulation time to the next event time and return the next event

        :return: The next event
        """
        # TODO: Implement timing logic
        raise NotImplementedError("Timing functionality not yet implemented.")

    def update_stats(self):
        """ Update the statistics in workstations and queues, based on elapsed time """
        # TODO: Implement statistics updating logic
        raise NotImplementedError("Statistics update not yet implemented.")

    def initialize(self):
        """
        Initialize the simulation by scheduling a single arrival event.
        """
        # TODO: Implement initialization logic
        raise NotImplementedError("Simulation initialization not yet implemented.")

    def run(self):
        """
        Run the simulation until max_time is reached.
        """
        # TODO: Implement simulation run logic
        raise NotImplementedError("Simulation run not yet implemented.")

    def new_arrival(self):
        """
        Handle a new arrival event, choose a random number and schedule the next arrival based on the probabilities.
        """
        # TODO: Implement new arrival logic
        raise NotImplementedError("New arrival handling not yet implemented.")

    def handle_entry(self, station: str):
        """
        Handle an entry event.
        """
        # TODO: Implement entry event handling
        raise NotImplementedError("Entry event handling not yet implemented.")

    def handle_exit(self, station: str):
        """
        Handle an exit event.
        """
        # TODO: Implement exit event handling
        raise NotImplementedError("Exit event handling not yet implemented.")

    def schedule_event(self, event: Event):
        """
        Schedule an event for the simulation and maintain the order by simulation time.
        """
        # TODO: Implement event scheduling
        raise NotImplementedError("Event scheduling not yet implemented.")

    def schedule_entry(self, station: str):
        """
        Schedule an entry event for a station.
        """
        # TODO: Implement entry scheduling
        raise NotImplementedError("Entry scheduling not yet implemented.")

    def calculate_stats(self):
        """
        Calculate statistics for the simulation.
        """
        # TODO: Implement statistics calculation
        raise NotImplementedError("Statistics calculation not yet implemented.")

    def get_stats(self):
        """
        :return: Print the simulation statistics.
        """
        # TODO: Implement stats retrieval
        raise NotImplementedError("Stats retrieval not yet implemented.")


# Example main function
if __name__ == "__main__":
    # Path to the input Excel file
    file_path = "Háma 2025.xlsx"

    # Create an instance of the processor
    processor = SimulationDataProcessor(
        file_path=file_path,
        stations=['Kassi1', 'Kassi2', 'Heitur matur', 'Kælir', 'Nýr kúnni'],
        incoming_name='Koma',
        outgoing_name='Fara',
        starting_selection='Nýr kúnni',
    )

    # Read and process the file
    processor.read_and_process_file()

    # Create and run the simulation
    simulation = SimulationProcess(processor, max_time=3600)  # Simulate for 1 hour
    try:
        simulation.initialize()
        simulation.run()
        simulation.get_stats()
    except NotImplementedError as e:
        print(e)
