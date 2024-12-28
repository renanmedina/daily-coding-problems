```c
#include <stdbool.h>

// Definition for a binary tree node.
typedef struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
} TreeNode;

bool isValidBST(TreeNode* root) {
    return helper(root, INT_MIN, INT_MAX);
}

bool helper(TreeNode* node, long long minVal, long long maxVal) {
    if (node == NULL)
        return true;

    if (node->val <= minVal || node->val >= maxVal)
        return false;

    return helper(node->left, minVal, node->val) &&
           helper(node->right, node->val, maxVal);
}
```