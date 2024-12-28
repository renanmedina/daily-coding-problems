```c
#include <stdio.h>
#include <stdlib.h>

void shuffleDeck(int* deck, int k) {
    random_shuffle(deck, 52);
}

int main() {
    // Initialize a deck of cards (assuming 0-indexed)
    int deck[52] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 
                    17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                    33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
                    49, 50, 51, 52};
    
    shuffleDeck(deck, 52);
    // Print the shuffled deck
    for (int i = 0; i < 52; i++) {
        printf("%d ", deck[i]);
    }
    return 0;
}
```