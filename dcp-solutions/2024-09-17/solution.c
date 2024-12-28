```c
int countUnivalSubtrees(struct TreeNode* root) {
    int cnt = 0;
    dfs(root, NULL);
    return cnt;

}

void dfs(struct TreeNode* node, struct TreeNode* val) {
    if (!node)
        return;
    
    if (val && node->val != val->val)
        return;
    
    if (!node->left && !node->right)
        ++cnt;
    
    dfs(node->left, node->val);
    dfs(node->right, node->val);
}
```

This solution works by using a depth-first search (DFS) to traverse the tree. For each node, it checks if all its children have the same value as itself and its parent. If they do, it increments the count of unival subtrees. The DFS also handles the base case where a node is NULL (i.e., we've reached the end of a branch).