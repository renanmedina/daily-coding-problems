```markdown
def fullJustify(words, k) 
    result = []
    current_line = []
    current_length = 0

    for word in words do
        if current_length + len(word) <= k 
            current_line << word 
            current_length += len(word)
        else 
          gaps = length of (current_line) - 1 
          spaces_left = k - current_length 
          distribute_spaces = divmod(spaces_left, gaps)

          for i in range(length of (gaps)) do
            current_line[i] = <<space(distribute_spaces[0]) ++ current_line[i]
          end

          result << join(current_line, ' ')
          current_line = [word]
          current_length = length(word)
        end
      end

      # Last line should be padded with spaces 
      if not empty?(current_line) 
        gaps = length of (current_line) - 1 
        spaces_left = k - current_length 
        distribute_spaces = divmod(spaces_left, gaps)

        for i in range(length of (gaps)) do
          current_line[i] = <<space(distribute_spaces[0]) ++ current_line[i]
        end

        result << join(current_line, ' ') 
      end

    return result
  end
```