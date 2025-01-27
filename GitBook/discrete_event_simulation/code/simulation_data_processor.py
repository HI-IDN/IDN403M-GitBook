import pandas as pd
from typing import Dict, List, Tuple, NamedTuple
import matplotlib.pyplot as plt

class EventState(NamedTuple):
    timestamp: float
    direction: str

class SimulationDataProcessor:
    """
    Class to handle the preprocessing of input data for the discrete event simulation.
    """

    def __init__(self, file_path: str, stations: List[str], incoming_name='Koma',
                 outgoing_name='Fara', starting_selection='Kerfi'):
        """
        Initialize the processor with the path to the input Excel file.

        :param file_path: Path to the input Excel file.
        :param stations: List of station names in the simulation.
        :param incoming_name: Name of the incoming direction.
        :param outgoing_name: Name of the outgoing direction.
        :param starting_selection: Name of the starting selection sheet.
        """
        self.file_path = file_path
        self.stations = stations
        self.incoming_name = incoming_name
        self.outgoing_name = outgoing_name
        self.starting_selection = starting_selection

        # Initialize the dictionaries to store processed data
        self.real_events: Dict[str, List[float]] = {event: [] for event in self.stations}
        self.incoming_prob: Dict[str, float] = {event: 0 for event in self.stations}
        self.mean_values: Dict[str, float] = {event: None for event in self.stations}

    def read_and_process_file(self) -> Tuple[
        Dict[str, List[float]], Dict[str, float], Dict[str, float]]:
        """
        Reads the Excel file and processes the data from each sheet to calculate interarrival times,
        mean values, and probabilities for incoming directions.

        :return: A tuple containing:
            - event_counts: Dictionary with the number of events for each direction.
            - total_events: Total number of events processed.
            - missing_events: Dictionary with the number of missing events for each direction.
        """
        # Initialize dictionaries and counters
        event_counts: Dict[str, int] = {event: 0 for event in self.stations}
        missing_events: Dict[str, int] = {event: 0 for event in self.stations}
        total_events = 0

        # Load the Excel file
        excel_data = pd.ExcelFile(self.file_path)

        for sheet_name in excel_data.sheet_names:
            # Read the sheet into a DataFrame
            df = excel_data.parse(sheet_name)

            if sheet_name == self.starting_selection:
                # Ensure the necessary columns exist
                if 'starting_station' not in df.columns or 'timestamp' not in df.columns:
                    raise ValueError(
                        f"Sheet '{sheet_name}' is missing required columns: 'starting_station' and 'timestamp'.")

                # TODO: Implement the logic to calculate incoming probabilities and interarrival times
                raise NotImplementedError("Processing starting selection sheet not yet implemented.")
            else:
                # This sheet contains inter-arrival times for a specific station

                # Ensure the necessary columns exist
                if 'direction' not in df.columns or 'timestamp' not in df.columns:
                    raise ValueError(
                        f"Sheet '{sheet_name}' is missing required columns: 'direction' and 'timestamp'.")

                # TODO: Implement the logic to calculate interarrival times and handle consecutive events
                raise NotImplementedError("Processing station sheet not yet implemented.")

        # TODO: Calculate mean values from the interarrival times
        raise NotImplementedError("Mean value calculation not yet implemented.")

        return event_counts, total_events, missing_events

    @staticmethod
    def plot_interarrival_times(interarrival_times: Dict[str, List[float]], file_path: str) -> None:
        """
        Plots the interarrival times for all stations in one figure with the mean displayed.

        :param interarrival_times: Dictionary where keys are station names and values are lists of interarrival times.
        :param file_path: Path to the output file.
        """
        # TODO: Implement the plotting logic for interarrival times
        raise NotImplementedError("Plotting functionality not yet implemented.")


# Example usage
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
    try:
        event_counts, total_events, missing_events = processor.read_and_process_file()
    except NotImplementedError as e:
        print(e)

    # Print the results for debugging
    print("Mean Values:", processor.mean_values)
    print("Incoming Probabilities:", processor.incoming_prob)

    # Plot the interarrival times
    try:
        processor.plot_interarrival_times(processor.real_events, 'HAMA_interarrival_times.png')
    except NotImplementedError as e:
        print(e)
