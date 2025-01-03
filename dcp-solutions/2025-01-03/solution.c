```c
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 *     struct TreeNode *root; // extra pointer to self 
 * };
 */
bool isSubtree(struct TreeNode* s, struct TreeNode* t) {
    return check_subtree(s, t) || isSubtree(s->left, t) || isSubtree(s->right, t);
}

bool check_subtree(struct TreeNode* s, struct TreeNode* t) {
    if (!s && !t) return true;
    if (!s || !t) return false;

    // check if the subtree t exists within the tree s
    bool result = (check_node_match(s, t)) ? true : false;
    return result && check_subtree(s->left, t) && check_subtree(s->right, t);
}

bool check_node_match(struct TreeNode* s, struct TreeNode* t) {
    if (!s && !t) return true;
    if (!s || !t) return false;

    // Check for matching values
    if (s->val != t->val) return false;

    // Recursively match left and right subtrees
    return check_node_match(s->left, t->left) &&
           check_node_match(s->right, t->right);
}
```