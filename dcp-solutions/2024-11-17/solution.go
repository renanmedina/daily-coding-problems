```markdown
package main

import (
    "fmt"
)

func countAttackingBishops(boardSize int, bishops []Pair) int {
    // Create a set to store the diagonals we've seen so far
    diagonals := make(map[Pair]bool)

    var attackCount int = 0

    for _, bishop1 := range bishops {
        for _, bishop2 := range bishops {
            // Skip if it's the same bishop
            if bishop1 == bishop2 {
                continue
            }

            // Check if they're on the same diagonal
            if areDiagonal(bishop1, bishop2) && diagonals[areDiagonalKey(bishop1, bishop2)] {
                attackCount++
            }

            // Add this diagonal to our set of seen diagonals
            diagonals[areDiagonalKey(bishop1, bishop2)] = true
        }
    }

    return attackCount / 2
}

func areDiagonal(p1 Pair) (Pair, bool) 
{
    dx := p1.Row - p1.Column
    dy := p1.Row + p1.Column

    // Diagonal key is a pair of values used to determine if two points are on the same diagonal.
    return Pair{dx, dy}, true
}

func areDiagonalKey(p1 Pair, p2 Pair) (Pair, bool)
{
    dx := p1.Row - p2.Row
    dy := p1.Column - p2.Column

    // Diagonal key is a pair of values used to determine if two points are on the same diagonal.
    return Pair{dx, dy}, true
}

type Pair struct {
    Row  int
    Column int
}
```