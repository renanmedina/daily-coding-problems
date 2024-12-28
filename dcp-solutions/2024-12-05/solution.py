```python
def min_remove_to_make_valid(s: str) -> int:
    """
    This function calculates the minimum number of parentheses to be removed 
    from a string to make it valid.
    
    Args:
        s (str): The input string containing parentheses.
    
    Returns:
        int: The minimum number of parentheses to be removed.
    """
    
    # Initialize a stack to keep track of opening parentheses
    stack = []
    
    # Initialize a set to store indices of invalid characters
    invalid_chars = set()
    
    # Iterate over the string
    for i, char in enumerate(s):
        # If the character is an opening parenthesis, push its index onto the stack
        if char == '(':
            stack.append(i)
        # If the character is a closing parenthesis
        elif char == ')':
            # If the stack is empty, it means there's no matching opening parenthesis
            if not stack:
                invalid_chars.add(i)
            else:
                # Pop the index of the matching opening parenthesis from the stack
                stack.pop()
    
    # Add indices of remaining opening parentheses to the set of invalid characters
    invalid_chars.update(stack)
    
    # The minimum number of parentheses to be removed is the size of the set
    return len(invalid_chars)
```