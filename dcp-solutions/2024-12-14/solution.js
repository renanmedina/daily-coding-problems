```javascript
function nextGreaterElement(digits) {
    let n = digits.length;
    let stack = [];
    
    for(let i=n-1; i>=0 ;i--){
        while(stack.length && stack[stack.length-1] <= digits[i]){
            stack.pop();
        }
        if(!stack.length){
            return [0].concat(digits);
        }
        let topElement = stack[stack.length - 1];
        if(topElement < digits[i]){
            break;
        }else{
            let j = n-1;
            while(j >= i){
                j--;
                if(digits[j] > topElement){
                    break;
                }
            }
            [digits[i], digits[j]] = [digits[j], digits[i]];
            stack.pop();
            break;
        }
    }

    for(let i=n-2;i>=0;i--){
        if(digits[i]<digits[i+1]){
            break;
        }
    }

    let j = n - 1;
    while(j >= i + 1){
        j--;
        [digits[i], digits[j]] = [digits[j], digits[i]];
    }
    return digits;
}
```