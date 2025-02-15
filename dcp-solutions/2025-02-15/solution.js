```javascript
function uniquePaths(matrix) {
    let n = matrix.length;
    let m = matrix[0].length;

    // create a copy of matrix and set every first element to 1 
    let dp = Array(n).fill(0).map(() => Array(m).fill(1));
    
    for(let i=1;i<n;i++){
        for(let j=1;j<m;j++){
            if(matrix[i][j] == 0){
                dp[i][j] = dp[i-1][j] + dp[i][j-1];
            } else {
                dp[i][j] = 0;
            }
        }
    }

    return dp[n-1][m-1];
}
```