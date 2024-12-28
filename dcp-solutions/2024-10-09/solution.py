```python
def trap(height):
    """
    Compute how many units of water remain trapped on a map.

    Args:
        height (list): A list of non-negative integers representing wall heights.

    Returns:
        int: The total amount of water that can be trapped.
    """
    if not height:
        return 0

    # Initialize variables to track the maximum left and right bounds
    max_left = [height[0]]
    max_right = [height[-1]]

    # Calculate the maximum left bound for each wall
    for i in range(1, len(height)):
        max_left.append(max(max_left[i-1], height[i]))

    # Calculate the maximum right bound for each wall
    for i in range(len(height) - 2, -1, -1):
        max_right.append(max(max_right[i+1], height[i]))

    # Initialize variable to track the total water trapped
    total_water = 0

    # Iterate over each wall and calculate the amount of water that can be trapped
    for i in range(1, len(height) - 1):
        min_bound = min(max_left[i], max_right[i])
        total_water += max(0, min_bound - height[i])

    return total_water
```