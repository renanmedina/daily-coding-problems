```ruby
def courseSchedule(prerequisites)
  graph = {}
  visited = {}
  ordering = []

  prerequisites.each do |course, prereqs|
    graph[course] = prereqs
    prereqs.each do |prereq|
      unless visited.key?(prereq)
        dfs(graph, preorder=prereq, visited, ordering)
      end
    end
  end

  return ordering if ordering.size == prerequisites.size
  return nil
end

def dfs(graph, course, visited, ordering)
  return unless visited.key?(course)

  visited[course] = :visiting
  graph[course].each do |prereq|
    unless visited.key?(prereq)
      dfs(graph, prereq, visited, ordering)
    elsif visited[prereq] == :visiting
      return false
    end
  end

  visited[course] = :visited
  ordering << course
end
```