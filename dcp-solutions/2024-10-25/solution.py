```python
def longest_palindromic_substring(s):
    def expand_around_center(left, right):
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        return s[left + 1:right]

    max_length = 0
    max_palindrome = ""
    for i in range(len(s)):
        palindrome_odd = expand_around_center(i, i)
        palindrome_even = expand_around_center(i, i + 1)
        if len(palindrome_odd) > max_length:
            max_length = len(palindrome_odd)
            max_palindrome = palindrome_odd
        if len(palindrome_even) > max_length:
            max_length = len(palindrome_even)
            max_palindrome = palindrome_even

    return max_palindrome
```