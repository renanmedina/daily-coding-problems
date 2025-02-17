```c
#include <stdio.h>
#include <stdlib.h>

// Structure to represent a tree node
typedef struct Node {
    int weight;
    struct Node* left;
    struct Node* right;
} Node;

// Function to create a new tree node
Node* newNode(int weight) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->weight = weight;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// Function to calculate the length of the longest path in the tree
int longestPathLength(Node* root, int maxPath) {
    if (root == NULL)
        return 0;

    int leftPath = longestPathLength(root->left, maxPath);
    int rightPath = longestPathLength(root->right, maxPath);

    // Calculate the length of the current path
    int currentPath = leftPath + rightPath + root->weight;
    if (currentPath > maxPath)
        maxPath = currentPath;

    return currentPath;
}

// Function to calculate the total weight of all paths in the tree
int longestPathWeight(Node* root) {
    if (root == NULL)
        return 0;

    int leftWeight = longestPathWeight(root->left);
    int rightWeight = longestPathWeight(root->right);

    // Calculate the total weight of all paths ending at the current node
    int currentWeight = leftWeight + rightWeight;
    if (currentWeight > root->weight)
        return currentWeight;

    return root->weight;
}

// Function to find the node with maximum weight in the tree
Node* findMax(Node* root) {
    if (root == NULL)
        return NULL;

    Node* max = root;
    findMax(root->left, &max);
    findMax(root->right, &max);

    return max;
}

// Function to calculate the longest path length using DFS
int longestPathLengthDfs(Node* root) {
    if (root == NULL)
        return 0;

    int maxLeft = longestPathLengthDfs(root->left);
    int maxRight = longestPathLengthDfs(root->right);

    // Calculate the length of the current path
    int currentPath = maxLeft + maxRight + root->weight;
    if (currentPath > root->left == NULL && root->right == NULL)
        return currentPath;

    return currentPath;
}
```