```c
#include <stdio.h>

int computeTrappedWater(int* elevationMap, int height) {
    int left = 0, right = height - 1;
    int maxLeft = 0, maxRight = 0;

    while (left < right) {
        if (elevationMap[left] <= elevationMap[right]) {
            // Water can be trapped on the left side
            if (elevationMap[left] >= maxLeft)
                maxLeft = elevationMap[left];
            else
                return elevationMap[left] * (right - left);

            left++;
        } else {
            // Water can be trapped on the right side
            if (elevationMap[right] >= maxRight)
                maxRight = elevationMap[right];
            else
                return elevationMap[right] * (right - left);

            right--;
        }
    }

    // If the two ends have same height, no water is trapped
    return 0;
}
```