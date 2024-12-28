```ruby
def rand7()
    while true
        x = rand(5) + 1
        y = rand(7)
        if x <= 7 && y <= 7
            return [x, y].min
        end
    end
end
```