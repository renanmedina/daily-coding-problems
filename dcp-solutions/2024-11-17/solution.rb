```ruby
def count_attacking_bishops(m, bishops):
    # Sort bishops by row and then column
    bishops = [[row, col] for row, col in bishops].sort_by { |x| [x[0], x[1]] }

    result = 0
    seen = {}

    for i in (0...bishops.size).reverse:
        r, c = bishops[i]
        if [r + i, c + i] in seen and seen[[r + i, c + i]] != i:
            result += 1
            seen[[r + i, c + i]] = i
        end
        seen[[r - i, c - i]] = i

    return (result + bishops.size) / 2
end
```