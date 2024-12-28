```elixir
defp dfs(graph, course_id) when is_integer(course_id), do: handle_dfs(graph, course_id, [], true)
defp dfs(graph, {course_id, prerequisites}) when is_integer(course_id), do: handle_dfs(graph, course_id, Enum.map(prerequisites, &dfs/1), false)

defp handle_dfs(graph, course_id, visited, can_complete) do
  if Enum.member?(visited, course_id) and not can_complete do
    nil
  end

  when is_integer(course_id) do
    visited ++ [course_id]
    for next_course <- graph[course_id] do
      result = dfs(graph, next_course)
      if nil == result do
        nil
      else
        visited
      end
    end
  when is_binary(course_id), true do
    case Map.get(graph, course_id) do
      nil ->
        visited

      prerequisites ->
        visited ++ Enum.map(prerequisites, &handle_dfs/1)
    end
  end
end

def sort_courses(graph) do
  case Enum.reduce(graph, [], fn {_course_id, _prerequisites} -> [nil]; {course_id, prerequisites} -> dfs(graph, {course_id, prerequisites}) end) do
    [] -> nil
    courses ->
      sorted_courses =
        Enum.map(courses, fn course ->
          if course != nil do
            course
          else
            Enum.sort(Enum.join(course))
          end
        end)
        |> Enum.uniq()
        |> Enum.sort()

      List.concat(sorted_courses)
  end
end
```