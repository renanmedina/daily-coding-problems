```ruby
def rotate_str(A, B)
  # if A is empty or has different length than B, it's impossible to shift A into B
  return false unless A.size == B.size

  # find index where rotating A would make it equal to B
  for i in 0..A.size-1 do
    # rotate string by shifting first 'i' characters to the end and adding them at the beginning 
    rotated_A = A[i...].concat(A[0..i-1])
    # if rotated string is equal to B, return True
    return true unless rotated_A == B
  end

  # if no rotation results in B, return False
  false
end
```