```c
#include <stdio.h>
#include <stdlib.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

int secondLargest(TreeNode* root) {
    if (root == NULL || root->val <= 0)
        return NULL;

    int max_val = INT_MIN;
    int second_max_val = INT_MIN;

    inorder(root, max_val, second_max_val);

    return second_max_val == INT_MIN ? NULL : second_max_val;
}

void inorder(TreeNode* node, int& max_val, int& second_max_val) {
    if (node == NULL)
        return;

    inorder(node->left, max_val, second_max_val);
    if (node->val > max_val)
        swap(max_val, second_max_val);
    if (node->val > second_max_val && node->val != max_val)
        second_max_val = node->val;

    inorder(node->right, max_val, second_max_val);
}
```