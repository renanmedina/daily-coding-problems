```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CARDINAL Directions as follows
#define N North
#define S South
#define E East
#define W West
#define NE NorthEast
#define NW NorthWest
#define SE SouthEast
#define SW SouthWest

int validate(const char* rules[], int size) {
    // Create a set to store points we've seen 
    int pointIndex = 0;
    char *pointBuffer = (char *)malloc(2 * sizeof(char));
    for (int i = 0; i < size; i++) {
        strcpy(pointBuffer, rules[i]);
        if (pointBuffer[0] == ' ') { // ignore spaces
            pointIndex++;
        }
    }

    // Check for each rule if the sum of directions validate or not
    int leftmostPoint = 1;
    int rightmostPoint = 2;
    while(*rules[leftmostPoint + 1]){
        char* pLeft = rules[leftmostPoint] + 1;
        char* pRight = rules[rightmostPoint + 1];
        
        if (*pLeft == N) {
            if (*pRight != S && *pRight != E){
                return 0;
            }
        } else if(*pLeft == S){
            if (*pRight != N && *pRight != W){
                return 0;
            }
        } else if(*pLeft == E){
            if (*pRight != W && *pRight != N){
                return 0;
            }
        }else if(*pLeft == W){
            if (*pRight != E && *pRight != S){
                return 0;
            }
        } else if(*pLeft == NE) {
            if (*pRight != SW && *pRight != N){
                return 0;
            }
        } else if(*pLeft == NW) {
            if (*pRight != SE && *pRight != W){
                return 0;
            }
        }else if(*pLeft == SE ) {
            if (*pRight != SW && *pRight != E){
                return 0;
            }
        } else if(*pLeft == SW) {
            if (*pRight != NE && *pRight != S){
                return 0;
            }
        }

        rightmostPoint++;
    }

    // Check for start and end points in the beginning 
    if(rightmostPoint - leftmostPoint == 1 && (*rules[leftmostPoint + 1] == N || *rules[rightmostPoint + 1] == S)){
        return 0;
    }else{
        return 1;
    }
}

```