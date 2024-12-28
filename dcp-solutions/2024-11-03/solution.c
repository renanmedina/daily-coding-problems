```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <unordered_map>
using namespace std;

unordered_map<string, string> url_map;
int counter = 0;

string shorten(string url) {
    while (url_map.size() <= counter + 100)
        url_map[""] = "";

    char code[7];
    sprintf(code, "%d", counter++);
    for (; !isalnum(code[0]); counter++)
        sprintf(code, "%d", counter);
    for (; !isalnum(code[counter - 1]); counter++)
        sprintf(code, "%d", counter);

    return string(code) + url;
}

string restore(string code) {
    auto it = url_map.find(code.substr(0, code.size() - 1));
    if (it != url_map.end())
        return code + it->second;
    else
        return "";
}
```