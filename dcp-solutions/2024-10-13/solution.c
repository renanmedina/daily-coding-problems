```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char make_palindrome(char* s) {
    int n = strlen(s);
    char result[n + 1];
    memset(result, 0, sizeof(result));

    if (n % 2 == 0) {
        return strcpy(result, s);
    }

    for (int i = 0; i < n / 2; i++) {
        result[2 * i] = s[i];
    }

    if ((n % 2 != 0 && s[n / 2 + 1] == 'a') || (n % 2 != 0)) {
        int j = n - 1;
        while (j > n / 2) {
            result[2 * i + 1] = s[j];
            i++;
            j--;
        }
    } else {
        int count = 0, add = 0;
        for (int j = n / 2; j < n - 1; j++) {
            if (s[j] != s[n - j - 1]) {
                count++;
                result[2 * i + add] = 'a';
                while (count > 0 && add <= j) {
                    count--;
                    result[add]++;
                    if (result[add] > 'z') {
                        result[add] = 'a';
                    }
                    add++;
                }
            } else {
                i++;
            }
        }
    }

    return result;
}
```