```c
#include <stdbool.h>
typedef struct Node {
    int val;
    bool locked;
    struct Node* left;
    struct Node* right;
} Node;

struct Node* newNode(int key) {
    Node* node = (Node*) malloc(sizeof(Node));
    node->val = key;
    node->locked = false;
    node->left = NULL;
    node->right = NULL;
    return node;
}

bool isLocked(Node* node) {
    if (node == NULL) return false;

    if (node->locked) return true;

    Node* temp = node;
    while (temp != NULL) {
        if (temp->locked) return true;
        if (temp->left != NULL && temp->left->locked) return true;
        if (temp->right != NULL && temp->right->locked) return true;
        temp = temp->parent ? temp->parent : node;
    }

    return false;
}

bool lock(Node* node) {
    if (isLocked(node)) return false;

    if (node->locked) return true;

    if (node->left != NULL && isLocked(node->left)) return false;
    if (node->right != NULL && isLocked(node->right)) return false;

    node->locked = true;
    return true;
}

bool unlock(Node* node) {
    if (!node->locked) return false;

    if (isLocked(node->parent)) return false;

    node->locked = false;
    return true;
}
```