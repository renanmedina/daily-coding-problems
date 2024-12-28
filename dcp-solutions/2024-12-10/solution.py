```python
functions = []
for i in range(10):
    # Use a default argument value to avoid capturing the variable's value at the time of function creation
    functions.append(lambda: i)  # i is evaluated here, not when f() is called
    
# We can fix this by using a closure or a wrapper function
def create_function(i):
    def inner():
        return i
    return inner

functions = []
for i in range(10):
    functions.append(create_function(i))

for f in functions:
    print(f())
```