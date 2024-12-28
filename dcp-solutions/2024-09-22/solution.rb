```ruby
def longest_substring_with_k_distinct(s, k)
  if s.empty? || k == 0
    return 0
  end

  max_length = 0
  freq = Hash.new(0)
  left = 0

  for right in 0...s.size
    freq[s[right]] += 1
    while freq.size > k
      freq[s[left]] -= 1
      if freq[s[left]] == 0
        freq.delete(s[left])
      end
      left += 1
    end

    max_length = [max_length, right - left + 1].max
  end

  return max_length
end
```