```python
def parseSentence(words, a):
    word_set = set(words)
    stack = []
    result = []

    for char in a:
        if char.isalpha():
            stack.append(char)
        elif not stack or stack.pop() != char:
            return None

    while stack:
        result.insert(0, ''.join(stack))
        stack.clear()

    words_set = set(word for word in words if word in a)

    # Try to insert words from the original list into the sentence
    for word in words:
        pos = 0
        while True:
            # Find all possible positions where the word can be inserted
            indices = [i for i, char in enumerate(a) if (char.isalpha() or char == ' ') and a[i-1] != word[0]]
            if not indices:
                break

            # Insert the word at one of these positions and see if it forms a valid sentence
            for i in indices:
                new_a = list(a)
                new_a.insert(i, word)
                new_string = ''.join(new_a)

                # If the resulting string is in our original set of words, we found a solution
                if new_string in word_set:
                    stack = []
                    result = []
                    for char in new_string:
                        if char.isalpha():
                            stack.append(char)
                        elif not stack or stack.pop() != char:
                            return None

                    # Fill the rest of the sentence with remaining characters
                    while stack:
                        result.insert(0, ''.join(stack))
                        stack.clear()

                    # If we reached this point, it means we found a solution, so we don't need to continue searching
                    break

            if pos > 0 and i == indices[0]:
                break

        pos += len(word)

    return result if any(result) else None
```