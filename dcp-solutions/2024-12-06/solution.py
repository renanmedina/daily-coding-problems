```python
def validate_rules(rules):
    directions = {
        'N': (0, 1),
        'S': (0, -1),
        'E': (1, 0),
        'W': (-1, 0)
    }

    pos_a = {'x': 0, 'y': 0}
    pos_b = {}

    for rule in rules:
        loc_a, d_a, loc_b = rule.split()
        dx, dy = directions[d_a]

        if d_a == 'N':
            pos_b['x'] += dx
            pos_b['y'] += dy
        elif d_a == 'S':
            pos_b['x'] -= dx
            pos_b['y'] -= dy
        elif d_a == 'E':
            pos_b['x'] += dx
            pos_b['y'] += dy
        elif d_a == 'W':
            pos_b['x'] -= dx
            pos_b['y'] -= dy

        if loc_b not in pos_b:
            pos_b[loc_b] = {'x': 0, 'y': 0}

        x_diff = pos_a['x'] - pos_b[loc_b]['x']
        y_diff = pos_a['y'] - pos_b[loc_b]['y']

        if (d_a == 'N' and x_diff != 0) or \
           (d_a == 'S' and x_diff == 0) or \
           (d_a == 'E' and y_diff != 0) or \
           (d_a == 'W' and y_diff == 0):
            return False

        pos_a = pos_b[loc_b]

    return True
```