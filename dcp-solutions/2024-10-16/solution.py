```python
def power_set(s):
    # Convert input list to set if it's a list
    s = set(s) if isinstance(s, list) else s
    
    # Initialize result and current subset
    result = [[]]
    
    # Iterate over each element in the set
    for elem in s:
        # Create new subsets by adding the current element to existing subsets
        new_subsets = [subset + [elem] for subset in result]
        
        # Add these new subsets to the result
        result.extend(new_subsets)
    
    return result
```