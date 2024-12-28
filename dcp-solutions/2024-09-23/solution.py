```python
import random

def estimate_circle_area(num_samples):
    inside_circle = 0
    for _ in range(num_samples):
        x, y = random.uniform(-1, 1), random.uniform(-1, 1)
        if x**2 + y**2 <= 1:
            inside_circle += 1
    return (inside_circle / num_samples) * 4

print(round(estimate_circle_area(1000000), 3))
```