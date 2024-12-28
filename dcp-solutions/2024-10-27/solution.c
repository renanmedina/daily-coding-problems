```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    char value;
    struct Node* left;
    struct Node* right;
} Node;

Node* createNode(char value) {
    Node* newNode = (Node*) malloc(sizeof(Node));
    if (!newNode) {
        printf("Memory error\n");
        return NULL;
    }
    newNode->value = value;
    newNode->left = newNode->right = NULL;
    return newNode;
}

void buildTreeFromPreorder(char preorder[], int start, int end) {
    if (start > end) return;

    Node* root = createNode(preorder[start]);
    char nextValue = preorder[++start];

    if (nextValue != '\0') {
        buildTreeFromPreorder(preorder, start + 1, start);
    }

    if (preorder[++start] == '\0' || preorder[start + 1] == '\0') return;

    root->left = createNode(preorder[start]);
    char nextLeftValue = preorder[++start];

    if (nextLeftValue != '\0') {
        buildTreeFromPreorder(preorder, start + 1, start);
    }

    root->right = createNode(preorder[start + 1]);
}

void inorder(Node* node, char inorder[], int start) {
    if (node == NULL || start >= sizeof(inorder)) return;

    inorder(node->value, start);

    inorder(node->left, start, start);

    inorder(node->right, start, start + 1);
}

Node* buildTreeFromInorder(char inorder[], char preorder[], int n) {
    Node* root = createNode(preorder[0]);
    int i = 1;
    for (int j = 0; j < n; j++) {
        if (inorder[j] == preorder[i]) {
            root->left = createNode(inorder[j + 1]);
            char nextValue = preorder[++i];

            if (nextValue != '\0') {
                root->right = buildTreeFromInorder(inorder, preorder, i - j - 2);
            } else {
                root->right = NULL;
            }
        }
    }
    return root;
}
```