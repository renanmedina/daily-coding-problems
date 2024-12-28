```c
#include <stdio.h>
#include <string.h>

int lengthLongestPath(const char *rootDir) {
    int maxLen = 0;
    char path[2048];
    int dirStack[1024], dirTop = 0;

    memset(path, '\0', sizeof(path));
    memset(dirStack, '\0', sizeof(dirStack));

    while (*rootDir != '\0') {
        if (*rootDir == '=') {
            // = means directory
            dirStack[dirTop] = *++rootDir;
            while (dirTop > 0 && *dirStack[dirTop - 1] == '\t') {
                --dirTop;
            }
            if (*dirStack[dirTop] == '\n') {
                ++dirTop;
            } else {
                int pathLen = strlen(path) + 1;
                maxLen = (maxLen > pathLen) ? maxLen : pathLen;
                while (dirTop > 0 && *dirStack[dirTop - 1] == '\t') {
                    --dirTop;
                }
                dirStack[dirTop] = '\0';
            }
        } else if (*rootDir != '/') {
            // add file name to the current directory
            char currPath[512];
            strncpy(currPath, path, sizeof(currPath) - 1);
            currPath[sizeof(currPath) - 1] = 0;
            strcat(currPath, "/");
            strcat(currPath, *rootDir);
            if (strchr(strcat(path, "/"), '/') == rootDir + 1) {
                char* lastSlashPos = strrchr(strcat(path, "/"), '/');
                if (*lastSlashPos == '\0') {
                    strncat(lastSlashPos + 1, "/", sizeof(currPath) - strlen(currPath));
                }
            }
            strcpy(path, currPath);
            int pathLen = strlen(path) + 1;
            maxLen = (maxLen > pathLen) ? maxLen : pathLen;
        }
        ++rootDir;
    }

    return maxLen;
}
```