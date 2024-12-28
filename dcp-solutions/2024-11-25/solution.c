```c
#include <stdio.h>

int min_cols_to_remove(char** grid, int n, int m) {
    int cols_to_remove = 0;
    char prev_char = '\0';

    // Iterate over each row in the matrix
    for (int i = 0; i < n; i++) {
        char* curr_row = grid[i];
        
        // Find the first column that is lexicographically earlier than the previous one
        for (int j = m - 1; j >= 0 && prev_char != '\0'; j--) {
            if (curr_row[j] <= prev_char) {
                break;
            }
            prev_char = curr_row[j];
        }
        
        // If we were able to find a column that is lexicographically earlier than the previous one, 
        // increment the count of columns to remove
        cols_to_remove += m - 1 - j;
    }

    return cols_to_remove;
}
```