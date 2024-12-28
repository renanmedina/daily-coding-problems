```python
def subsetSum(S, k):
    S.sort()
    def helper(i, target, path):
        if target < 0:
            return None
        if i == len(S) and target == 0:
            return path[::-1]
        include = helper(i + 1, target - S[i], path + [S[i]])
        exclude = helper(i + 1, target, path)
        if include is not None:
            return include
        else:
            return exclude

    result = helper(0, k, [])
    if result is None:
        return None
    return list(result)