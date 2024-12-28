```ruby
def longest_palindrome(s)
  def expand_around_center(s, left, right)
    while left >= 0 && right < s.length && s[left] == s[right]
      left -= 1
      right += 1
    end
    s[left + 1..right - 1]
  end

  longest = ""
  for i in 0...s.length
    # Odd length palindrome
    palindrome = expand_around_center(s, i, i)
    if palindrome.length > longest.length
      longest = palindrome
    end

    # Even length palindrome
    palindrome = expand_around_center(s, i, i + 1)
    if palindrome.length > longest.length
      longest = palindrome
    end
  end

  longest
end
```