```c
#include <stdio.h>
#include <stdlib.h>

char** fullJustify(int n, char** words, int m) {
    if (n == 1 && m > 0)
        return NULL;
    
    int i = 0, j = 0, last = -1, curr_len = 0;
    char** res = (char**)malloc(n * sizeof(char*));
    for (; i < n; ++i) {
        while (j < words[i] && curr_len + m - last >= m)
            ++curr_len, --j;
        int spaces = j > 0 ? m - (words[i] - words[j]) : m;
        if (last == -1)
            for (; curr_len <= spaces; ++curr_len) {
                res[i] = (char*)malloc(curr_len + 2 * sizeof(char));
                res[i][0] = ' ';
                --spaces;
            }
        else
            for (; curr_len < spaces; ++curr_len) {
                if (i == last)
                    break;
                res[last] = (char*)realloc(res[last], curr_len + 2);
                res[last][curr_len++] = ' ';
            }
        res[i][curr_len] = '\0';
        if (j > 0 && curr_len <= words[i] - words[j])
            for (; j < words[i]; ++j)
                res[i][curr_len++] = words[j];
        else
            res[last] = (char*)realloc(res[last], curr_len + words[i] - last);
        last = i, curr_len = 0;
    }
    if (last == n - 1)
        for (; curr_len < m; ++curr_len)
            res[n - 1][curr_len++] = ' ';
    return res;
}
```