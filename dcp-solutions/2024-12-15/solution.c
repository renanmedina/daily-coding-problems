```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void backtrack(int* nums, int start, int end, int length, int* used, char** res) {
    if (start == end) {
        char* temp = malloc((length + 1) * sizeof(char));
        for (int i = 0; i < length; ++i)
            temp[i] = '0' + nums[start + i];
        temp[length] = '\0';
        res[0][length] = strdup(temp);
    } else {
        for (int i = start; i <= end; ++i) {
            if (used[i]) continue;
            used[i] = 1;
            backtrack(nums, start + 1, end, length + 1, used, res);
            used[i] = 0;
        }
    }
}

void getPermutations(int* nums, int length, char** res) {
    int* used = malloc((length + 1) * sizeof(int));
    memset(used, 0, (length + 1) * sizeof(int));
    backtrack(nums, 0, length - 1, 0, used, res);
}

int main() {
    // Initialize your variables here
    int nums[] = {1,2,3};
    char** res = NULL;
    getPermutations(nums, 3, &res);
    for (int i = 0; res[i] != NULL; ++i) {
        printf("%s\n", res[i]);
        free(res[i]);
    }
    // Don't forget to free the memory you allocated
    for (int i = 0; i < 6; ++i) {
        free(res[i]);
    }
    free(res);
    return 0;
}
```