```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int val;
    char *ltrs;
} Node;

void build(int val, char **ltrs, char *mp[], int len) {
    if (val == 0) return;
    
    Node* node = (Node*)malloc(sizeof(Node));
    node->val = val % 10;
    char *temp = strdup(ltrs[val / 10]);
    int size = strlen(temp);
    for (int i = 0; i < size; i++) {
        node->ltrs = (char*)realloc(node->ltrs, (size + 1) * sizeof(char));
        node->ltrs[size] = temp[i];
        node->ltrs[size + 1] = '\0';
    }
    for (int j = 0; j < strlen(ltrs[val / 10]); j++) {
        char* temp2 = (char*)malloc((size + strlen(node->ltrs) + 1) * sizeof(char));
        strcpy(temp2, ltrs[val / 10]);
        strcat(temp2, node->ltrs);
        printf("%s\n", temp2);
    }
    free(temp);
    free(node->ltrs);
}

void dfs(int val, char **ltrs, char *mp[]) {
    if (val == 0) return;
    
    Node* node = (Node*)malloc(sizeof(Node));
    node->val = val % 10;
    char *temp = strdup(ltrs[val / 10]);
    int size = strlen(temp);
    for (int i = 0; i < size; i++) {
        node->ltrs = (char*)realloc(node->ltrs, (size + 1) * sizeof(char));
        node->ltrs[size] = temp[i];
        node->ltrs[size + 1] = '\0';
    }
    
    for (int j = 0; j < strlen(ltrs[val / 10]); j++) {
        char* temp2 = (char*)malloc((size + strlen(node->ltrs) + 1) * sizeof(char));
        strcpy(temp2, ltrs[val / 10]);
        strcat(temp2, node->ltrs);
        printf("%s\n", temp2);
        
    }
}

void solve(int val, char **ltrs, int len, char *mp[]) {
    if (val == 0) return;
    
    Node* node = (Node*)malloc(sizeof(Node));
    node->val = val % 10;
    char *temp = strdup(ltrs[val / 10]);
    int size = strlen(temp);
    for (int i = 0; i < size; i++) {
        node->ltrs = (char*)realloc(node->ltrs, (size + 1) * sizeof(char));
        node->ltrs[size] = temp[i];
        node->ltrs[size + 1] = '\0';
    }
    
    for (int j = 0; j < strlen(ltrs[val / 10]); j++) {
        char* temp2 = (char*)malloc((size + strlen(node->ltrs) + 1) * sizeof(char));
        strcpy(temp2, ltrs[val / 10]);
        strcat(temp2, node->ltrs);
        dfs(node->val, temp2, mp);
    }
    
    free(temp);
    free(node->ltrs);
}

void build_helper(int val, char **ltrs, int len) {
    if (val == 0) return;
    
    Node* node = (Node*)malloc(sizeof(Node));
    node->val = val % 10;
    for (int i = 1; i <= len; i++) {
        printf("%d\n",node->val);
        
    }
}

void dfs_helper(int val, char **ltrs, int len) {
    
}
```