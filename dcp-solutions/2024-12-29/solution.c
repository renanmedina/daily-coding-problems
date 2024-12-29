```c
#include <stdio.h>
#include <stdlib.h>

typedef struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

void traverse(TreeNode* root, char** paths) {
    if (!root)
        return;

    if (!root->left && !root->right) {
        char* path = malloc(sizeof(char)* 2);
        path[0] = root->val + '0';
        path[1] = '\0';
        paths[0] = path;
        *paths += 1;
    }

    traverse(root->left, paths);
    traverse(root->right, paths);
}

void getAllPaths(TreeNode* root, char** paths) {
    TreeNode* node = root;
    while (node != NULL) {
        if (node->left == NULL && node->right == NULL)
            continue;

        char path[10000];
        int path_len = 0;
        traverse(node, &path);
        for (int i = 0; i < path_len; ++i)
            path[i + path_len] = '\0';
        paths[path_len] = malloc(sizeof(char) * (path_len + 1));
        strcpy(paths[path_len], path);
        *paths += 1;
    }
}

void printPaths(TreeNode* root) {
    char** paths = NULL;

    getAllPaths(root, &paths);

    for (int i = 0; paths[i] != NULL; ++i)
        printf("%s ", paths[i]);

    free(paths);
}

TreeNode* createTree(int inOrder[], int size) {
    if (size == 0)
        return NULL;
    
    TreeNode* root = malloc(sizeof(TreeNode));
    root->val = inOrder[0];
    root->left = createTree(inOrder + 1, size - 1);
    root->right = createTree(inOrder + 2, size - 2);

    return root;
}

int main() {
    int inOrder[] = {1, 2, 3, 4, 5};
    int n = sizeof(inOrder) / sizeof(inOrder[0]);
    TreeNode* tree = createTree(inOrder, n);
    printPaths(tree);
    return 0;
}
```