```python
def reverse_words(s):
    words = s.split()
    words.reverse()
    return ' '.join(words)
```

In-place version:
```python
def reverse_words_in_place(s):
    left, right = 0, len(s) - 1
    while left < right:
        if not s[left].isalpha():
            left += 1
        elif not s[right].isalpha():
            right -= 1
        else:
            s[left], s[right] = s[right], s[left]
            left, right = left + 1, right - 1
    return s
```