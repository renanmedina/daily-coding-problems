```c
#include <stdio.h>
#include <stdlib.h>

int count_inversions(int* arr, int start, int end) {
    if (start >= end) {
        return 0;
    }
    
    int mid = start + (end - start) / 2;
    
    // Count inversions in left and right subarrays
    int left_inversions = count_inversions(arr, start, mid);
    int right_inversions = count_inversions(arr, mid + 1, end);
    
    // Merge the subarrays and count inversions between them
    int merged_inversions = merge_and_count(arr, start, mid, end, &left_inversions, &right_inversions);
    
    return left_inversions + right_inversions + merged_inversions;
}

int merge_and_count(int* arr, int start1, int end1, int start2, int* left_inversions, int* right_inversions) {
    int i = start1, j = start2;
    int inversions = 0;
    
    while (i <= end1 && j <= end2) {
        if (arr[i] <= arr[j]) {
            i++;
        } else {
            *left_inversions += (end1 - i + 1);
            inversions += (end1 - i + 1);
            j++;
        }
    }
    
    *right_inversions += (end2 - j + 1);
    return inversions;
}
```