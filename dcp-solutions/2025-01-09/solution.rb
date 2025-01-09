```ruby
def canMakePalindrome(s, k)
  left = 0
  right = s.size - 1
  count = 0

  while left < right
    if s[left] != s[right]
      count += 1
      return false unless count <= k
    end
    left += 1
    right -= 1
  end

  true
end
```