```python
class GameOfLife:
    def __init__(self, live_cells, steps):
        self.live_cells = set(live_cells)
        self.steps = steps

    def next_generation(self):
        new_board = set()
        for x in range(-10, 11): # assume the board is at least 20x20
            for y in range(-10, 11): 
                live_neighbours = 0
                for dx in [-1, 0, 1]:
                    for dy in [-1, 0, 1]: 
                        nx, ny = x + dx, y + dy
                        if (nx == 0 and ny == 0) or (dx != 0 or dy != 0):
                            continue
                        if (nx, ny) in self.live_cells:
                            live_neighbours += 1 
                if nx == 0 and ny == 0: 
                    continue 
                state = 0 # dead cell initially
                if (nx, ny) in self.live_cells or live_neighbours in [2, 3]:
                    state = 1 # alive cell
                new_board.add((nx, ny)) if state else new_board.discard((nx, ny))
        self.live_cells = new_board

    def play(self):
        for i in range(self.steps): 
            print("Step: ", i + 1)
            board_str = ""
            for x in range(-10, 11): 
                for y in range(-10, 11): 
                    if (x, y) in self.live_cells:
                        board_str += "* "
                    else:
                        board_str += ". "
                print(board_str)
            print("\n")
            self.next_generation()
```