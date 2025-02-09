```python
import numpy as np

def sample_from_distribution(numbers, probabilities):
    """
    Select a number from the given list based on its corresponding probability.

    Parameters:
    numbers (list): List of numbers to select from.
    probabilities (list): List of probabilities corresponding to each number.

    Returns:
    tuple: A tuple containing the selected number and its probability.
    """
    # Check if the input lists have the same length
    assert len(numbers) == len(probabilities)

    # Use numpy's random.choice function to select a number based on the given probabilities
    index = np.random.choice(len(numbers), p=probabilities)
    return numbers[index], probabilities[index]
```