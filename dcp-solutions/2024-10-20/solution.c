```c
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct Graph {
    int** adj;
    int numVertices;
} Graph;

Graph* createGraph(int numVertices) {
    Graph* g = (Graph*)malloc(sizeof(Graph));
    g->adj = (int**)malloc(numVertices * sizeof(int*));
    for (int i = 0; i < numVertices; ++i)
        g->adj[i] = (int*)malloc(2);
    g->numVertices = numVertices;
    return g;
}

void addEdge(Graph* g, int u, int v) {
    int edge = 1;
    if (g->adj[u][0] != v && g->adj[v][edge] != u)
        g->adj[u][edge] = v;
}

bool dfs(Graph* g, char start, char end, bool* visited) {
    for (int i = 0; i < g->numVertices; ++i) {
        if (g->adj[start][0] == i && !visited[i]) {
            visited[i] = true;
            if ((i == end) || dfs(g, (char)i, end, visited)) return true;
            visited[i] = false;
        }
    }
    return false;
}

void findItinerary(Graph* g, char start, int numVertices) {
    bool* visited = (bool*)malloc(numVertices * sizeof(bool));
    for (int i = 0; i < numVertices; ++i)
        visited[i] = false;

    char** path = (char**)malloc(numVertices * sizeof(char*));
    for (int i = 0; i < numVertices; ++i)
        path[i] = (char*)malloc(2);

    int numPaths = 0;
    for (int i = 0; i < numVertices; ++i) {
        if (!visited[i]) {
            visited[i] = true;
            bool found = dfs(g, (char)i, start, visited);
            if (found)
                numPaths++;
            else
                path[numPaths++] = (char*)malloc(2);
        }
    }

    for (int i = 0; i < numPaths; ++i) {
        free(path[i]);
    }

    printf("%c", start);

    int edge = 1;
    for (int i = 0; i < numVertices - 1; ++i) {
        for (edge = 0; edge < 2; ++edge) {
            if ((g->adj[start][edge] > 0) && !visited[g->adj[start][edge]]) break;
        }
        free(path[i]);
        path[i] = (char*)malloc(2);
        path[i][0] = start;
        int temp = g->adj[start][edge];
        visited[temp] = true;
        for(int j=1;temp>0;j++)
            temp=g->adj[temp][j],path[i][j-1]=temp;
        free(g->adj[start]);
        g->adj[start] = (int*)malloc(2);
        g->adj[start][edge+1]=start;
    }
    printf("\n");

}

void printGraph(Graph* g) {
    for (int i = 0; i < g->numVertices; ++i)
        printf("%c ", (char)i);

    printf("\n");
    for (int i = 0; i < g->numVertices; ++i) {
        for (int j = 0; j < 2; ++j)
            if (g->adj[i][j] > 0)
                printf("(%c %c ) ", (char)i, (char)g->adj[i][j]);
        printf("\n");
    }
}

void freeGraph(Graph* g) {
    for (int i = 0; i < g->numVertices; ++i)
        free(g->adj[i]);

    free(g->adj);
    free(g);
}

int main() {
    Graph g1 = createGraph(6);

    addEdge(&g1, 0, 1);
    addEdge(&g1, 1, 2);
    addEdge(&g1, 2, 3);
    addEdge(&g1, 3, 4);
    addEdge(&g1, 4, 5);

    printGraph(&g1);
    findItinerary(&g1,'A',6);
    freeGraph(&g1);

    return 0;
}
```