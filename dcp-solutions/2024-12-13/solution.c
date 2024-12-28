```c
#include <stdlib.h>
#include <limits.h>

int maxPathSum(struct TreeNode* root) {
    int res = INT_MIN;
    dfs(root, 0);
    return res;

}

int dfs(struct TreeNode* node, int cur_sum) {
    if (!node)
        return 0;

    int lsum = max(0, dfs(node->left, cur_sum));
    int rsum = max(0, dfs(node->right, cur_sum));

    cur_sum += node->val;
    res = max(res, cur_sum + lsum + rsum);

    return node->val > 0 ? max(lsum, rsum) : 0;
}
```