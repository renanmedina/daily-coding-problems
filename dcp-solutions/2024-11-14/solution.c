```c
#include <stdio.h>

void printSpiral(int matrix[][1000], int n, int m) {
    if (n == 0 || m == 0)
        return;
    
    int top = 0, bottom = n - 1, left = 0, right = m - 1;
    
    while (top <= bottom && left <= right) {
        for (int i = left; i <= right; i++)
            printf("%d ", matrix[top][i]);
        
        top++;
        
        for (int i = top; i <= bottom; i++)
            printf("%d ", matrix[i][right]);
            
        right--;
        
        if (top <= bottom) {
            for (int i = right; i >= left; i--)
                printf("%d ", matrix[bottom][i]);
                
            bottom--;
        }
        
        if (left <= right) {
            for (int i = bottom; i >= top; i--)
                printf("%d ", matrix[i][left]);
                
            left++;
        }
    }
}

// Function to print the spiral
void printSpiral1(int matrix[][1000], int n, int m)
{
    if (n == 0 || m == 0)
        return;

    int t = 0;
    while(t <= n-1 && t <= m-1){
      for(int i=t; i<m-t;i++)
        printf("%d ", matrix[t][i]);

      for(int i=m-t; i>t;i--)
        printf("%d ",matrix[i][t]);
      
      if(n-t>1)
         for(int i=m-t; i>t;i--)
            printf("%d ",matrix[i][n-t]);

      if(t<n-1){
          for(int j=n-t; j>m-t;j--)
             printf("%d ",matrix[t][j]);       
          t++;
       }
    }

}

// Function to print the spiral
void printSpiral2(int matrix[][1000], int n, int m) {
  int top = 0;
  int bottom = n - 1;
  int left = 0;
  int right = m - 1;

  while (top <= bottom && left <= right)
    { 
      for (int i = left; i <= right; i++)
        printf("%d ", matrix[top][i]);
      
      top++;
      for (int i = top; i <= bottom; i++)
        printf("%d ", matrix[i][right]);
        
      right--;
      if(top<=bottom){
          for (int i = right; i >= left; i--)
            printf("%d ", matrix[bottom][i]);          
          bottom--;      
        }
        if(left<=right){ 
          for (int i = bottom; i >= top; i--)   
            printf("%d ", matrix[i][left]);
        
          left++;
        }     
     }

    }

```