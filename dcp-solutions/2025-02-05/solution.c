```c
#include <stdio.h>
#include <stdlib.h>

// Function to generate Gray code for a given number of bits n
void grayCode(int n) {
    int num = 1 << n;
    int* grayCodes = (int*)malloc(num * sizeof(int));
    
    // Base case: single-bit binary numbers
    for (int i = 0; i < num; ++i) {
        grayCodes[i] = i;
    }
        
    // Recursive calculation for more than one bit
    for (int len = n + 1; len <= num; ++len) {
        int prevGrayCodeLen = len - 1;
        int prevGrayCodeNum = num / 2;
        int* grayCodeArr = (int*)malloc(grayCodeNum * sizeof(int));
        
        // Copy last Gray code for the current bit length
        for (int i = 0; i < prevGrayCodeNum; ++i) {
            grayCodeArr[i] = grayCodes[(prevGrayCodeNum - 1) * len / prevGrayCodeLen + i];
        }
            
        int* grayCodeList = (int*)malloc(grayCodeNum * sizeof(int));
        
        // Create new Gray code numbers for the current bit length
        int grayCodeIndex = 0;
        for (int i = 0; i < prevGrayCodeNum / 2; ++i) {
            grayCodeArr[i] ^= grayCodes[(prevGrayCodeNum - 1) * len / prevGrayCodeLen + i + prevGrayCodeNum / 2];
            grayCodeList[grayCodeIndex++] = grayCodes[(prevGrayCodeNum - 1) * len / prevGrayCodeLen + i];
        }
            
        for (int i = prevGrayCodeNum / 2; i < prevGrayCodeNum; ++i) {
            grayCodeArr[i] ^= grayCodes[(prevGrayCodeNum - 1) * len / prevGrayCodeLen + i - prevGrayCodeNum / 2];
            grayCodeList[grayCodeIndex++] = grayCodes[(prevGrayCodeNum - 1) * len / prevGrayCodeLen + i];
        }
            
        free(grayCodes);
        grayCodes = grayCodeArr;
        grayCodeNum = grayCodeIndex;
    }
        
    // Print the generated Gray code
    for (int i = 0; i < num; ++i) {
        printf("%08d ", grayCodes[i]);
    }
    
    // Cleanup
    free(grayCodes);
}

// Driver function to call grayCode
int main() {
    int n;
    printf("Enter the number of bits: ");
    scanf("%d", &n);
    grayCode(n);
    return 0;
}
```