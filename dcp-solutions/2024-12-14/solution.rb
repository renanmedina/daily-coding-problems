```ruby
def nextGreaterElement(digits)
  stack = []
  # find first decreasing number from right to left 
  i = digits.size - 1
  while i >= 0 && digits[i] > digits[stack[-1]]
    i -= 1
  end
  
  return if i < 0

  # store indices of smaller numbers in stack
  j = digits.size
  until i >= 0
    j = i
    while stack.size > 0 && digits[i] > digits[stack[-1]]
      stack.pop
    end
    stack.push i
    
    i -= 1
  end

  # reverse digits from j to the right 
  tmp, i = digits[j], j + 1
  while i < digits.size
    digits[i], tmp = tmp, digits[i]
    i += 1
  end
  
  # reverse digits in stack from top to bottom with the new last number being j
  while stack.size > 0 && digits[stack[-1]] > digits[j]
    tmp, stack.pop = stack[-1], digits[stack.pop]
    digits[stack[-1]], tmp = tmp, digits[stack[-1]]
  end

  # return the result in descending order 
  digits
end
```