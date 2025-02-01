### Problem Solution (Ruby)

```markdown
def next_greater_element_left(arr, i)
  stack = []
  max_val = -1
  max_idx = nil
  
  arr.each_with_index do |num, idx|
    while stack.any? && num >= stack[-1]
      if stack[-1] < max_val
        max_val = stack.pop
        max_idx = stack.last
      end
    end
    stack << [num, idx] unless (stack.any? && stack.last[0] == num)
  end
  
  if max_val != -1
    return arr.index(max_val)
  else
    return nil
  end
end

def next_greater_element_right(arr, i)
  stack = []
  max_val = -1
  max_idx = nil
  
  (arr.length - 1).downto(i) do |idx|
    while stack.any? && arr[idx] > arr[stack[-1]]
      if stack[-1] < max_val
        max_val = stack.pop
        max_idx = stack.last
      end
    end
    stack << idx unless (stack.any? && arr[idx] == arr[stack.last])
  end
  
  return nil if max_val == -1
  return i + max_idx
end

def next_greater_element(arr, i)
  return next_greater_element_left(arr, i) || next_greater_element_right(arr, i)
end
```