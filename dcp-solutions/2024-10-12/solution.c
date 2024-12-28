```c
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int left;
    int right;
} SegmentTree;

SegmentTree* build(int nums[], int n) {
    SegmentTree* tree = (SegmentTree*) malloc(sizeof(SegmentTree));
    tree->left = (int*) malloc(sizeof(int) * ((n + 1) / 2));
    tree->right = (int*) malloc(sizeof(int) * ((n + 1) / 2));
    
    int i = 0;
    for (; i < n; i += 2) {
        tree->left[i / 2] = nums[i];
    }
    if (n % 2 == 0) {
        tree->right[0] = nums[n - 1];
    } else {
        tree->right[0] = nums[i];
    }

    return tree;
}

void update(SegmentTree* tree, int n, int i, int val) {
    if (n % 2 == 0) {
        if (i < (n + 1) / 2) {
            tree->left[(n - 1) / 2] = val;
        } else {
            tree->right[(n + 1) / 2] = val;
        }
    } else {
        if (i == (n + 1) / 2) {
            tree->right[0] = val;
        } else {
            tree->left[i / 2] = val;
        }
    }

    i = n - 1;
    while (i > 0) {
        int mid = (i / 2);
        if ((mid + 1) < (n + 1) / 2 && tree->left[mid] > tree->right[mid]) {
            swap(tree->left, tree->right, mid, mid + 1);
        }
        i /= 2;
    }
}

int query(SegmentTree* tree, int n) {
    if (n % 2 == 0) {
        return ((tree->left[(n - 1) / 2] + tree->right[(n + 1) / 2]) / 2);
    } else {
        return tree->right[0];
    }
}

void solve(int nums[], int n) {
    SegmentTree* tree = build(nums, n);

    for (int i = 0; i < n; i++) {
        printf("%d\n", query(tree, n + i));
        update(tree, n + i, i, nums[i]);
    }
}

void swap(int* a, int* b, int idx1, int idx2) {
    int temp = *a;
    *a = *b;
    *b = temp;
}
```