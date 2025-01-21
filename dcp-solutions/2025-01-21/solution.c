```c
#include <limits.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
    struct TreeNode *parent;
};

int inorderSuccessor(struct TreeNode* root, struct TreeNode* node) {
    if (node->right != NULL && searchNode(node->right, node->val)) return findNextBigger(root, node);
    else {
        while (node->parent != NULL && node == findLeftMost(node->parent, node->val))
            node = node->parent;
        return findNextBigger(root, node->parent);
    }
}

int searchNode(struct TreeNode* root, int val) {
    if (root == NULL || root->val >= val)
        return 0;
    else
        return searchNode(root->left, val) + searchNode(root->right, val) + 1;
}

struct TreeNode* findLeftMost(struct TreeNode* node, int val) {
    while (node != NULL && node->val <= val)
        node = node->right;
    return node;
}

int findNextBigger(struct TreeNode* root, struct TreeNode* node) {
    if (node == root) return INT_MAX;

    if (root->left != NULL && searchNode(root->left, node->val)) 
        return findLeftMost(root->parent, node->val);

    if (root->right != NULL && searchNode(root->right, node->val))
        return findLeftMost(root, node->val);
    
    struct TreeNode* successor = root->right;
    while(successor != NULL && successor->left == node)
        successor = successor->right;

    int temp = node->val;
    node->val = successor->val;
    successor->val = temp;

    return findLeftMost(root, node->val);
}
```