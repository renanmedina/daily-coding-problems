```ruby
def possible_colors(graph, k)
  n = graph.size
  colors = Array.new(n) { 0 }

  def backtrack(v, used)
    return true if v == n
    color_count = Array.new(k) { 0 }
    (0...k).each do |c|
      next if used.include?(c)

      return false if (0...n).any? { |u| graph[v][u] != 0 && colors[u] == c }

      used << c
      colors[v] = c
      return backtrack(v + 1, used)
    end

    used.each { |c| colors[v] = -1 }
    true
  end

  backtrack(0, [])
end
```