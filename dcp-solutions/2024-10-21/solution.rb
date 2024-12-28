```ruby
def subset_sum(S, k)
  S.sort!.reverse!
  return nil if S.empty?

  memo = {}
  def recursive_sum(i, total, taken)
    return true if total == k
    return false if i >= S.size || total > k

    if memo.key?([i, total])
      return memo[[i, total]]
    end

    if not recursive_sum(i + 1, total, taken)
      memo[[i, total]] = false
      return false
    end

    result = recursive_sum(i + 1, total + S[i], taken | [S[i]])
    memo[[i, total]] = result
    return result
  end

  if S[0] <= k
    return [S[0]] if recursive_sum(0, S[0], []) == true
  end

  recursive_sum(0, 0, [])
end
```