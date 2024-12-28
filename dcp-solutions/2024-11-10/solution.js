```javascript
function myPow(x, y) {
    if (x == 0) return 0;
    let absY = Math.abs(y);
    let result = 1;
    
    while(absY > 0){
        if((absY&1) != 0){
            result *= x; 
        }
        x = x * x; 
        absY >>= 1; 
    }

    if (y < 0){
        return 1 / result;
    } else {
        return result;
    }
}
```