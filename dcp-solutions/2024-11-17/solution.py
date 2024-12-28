```python
def count_bishop_attacks(n, bishops):
    attacks = set()
    bishop_set = set(bishops)
    
    def get attacking_diagonal(row, col):
        direction = 1 if row + col < n else -1
        diagonal = (row + direction) * direction
        return diagonal

    for i, bishop in enumerate(bishops):
        for j in range(i+1, len(bishops)):
            other_bishop = bishops[j]
            if abs(get_attacking_diagonal(bishop[0], bishop[1]) - get_attacking_diagonal(other_bishop[0], other_bishop[1])) == abs(bishop[0] - other_bishop[0]):
                attacks.add(tuple(sorted((i, j))))
                
    return len(attacks)
```