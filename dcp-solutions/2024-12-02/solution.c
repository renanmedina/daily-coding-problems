```c
// Definition for a binary tree node.
struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
    struct TreeNode *next;
};

struct TreeNode* invertTree(struct TreeNode* root) {
    if (root == NULL)
        return NULL;

    // Swap the left and right child nodes
    struct TreeNode* temp = root->left;
    root->left = root->right;
    root->right = temp;

    // Recursively call the function for both child nodes
    invertTree(root->left);
    invertTree(root->right);

    return root;
}
```