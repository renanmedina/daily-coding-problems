```c
#include <stdbool.h>

bool dfs(int i, int j, bool* vis, bool** adj, int* c, int n, int k) {
    if (i >= n || i < 0 || j >= n || j < 0) return true;
    if (vis[i] || vis[j]) return false;

    if (*c == k) {
        return dfs(i + 1, j, vis, adj, c, n, k);
    }

    vis[i] = true;
    vis[j] = true;
    *c += 1;

    bool res = dfs(i + 1, j, vis, adj, c, n, k) && dfs(i, j + 1, vis, adj, c, n, k);
    vis[i] = false;
    vis[j] = false;

    return res;
}

bool colorGraph(bool** adj, int n, int k) {
    bool* vis = (bool*)malloc(n * sizeof(bool));
    int* c = (int*)malloc(sizeof(int));

    for (int i = 0; i < n; i++) {
        if (!vis[i]) {
            if (!dfs(i, 0, vis, adj, c, n, k)) return false;
        }
    }

    free(vis);
    free(c);

    return true;
}
```