```python
class URLShortener:
    def __init__(self):
        self.cache = {}

    def shorten(self, url):
        import random
        import string

        while True:
            short_code = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
            if short_code not in self.cache and url not in self.cache[short_code]:
                self.cache[short_code] = url
                return short_code


    def restore(self, code):
        return self.cache.get(code)
```