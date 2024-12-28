```php
class URLShortener {
    private $urlMap = array();
    private $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    public function shorten($url) {
        $shortenedUrl = substr(str_shuffle($this->alphabet), 0, 6);
        if (isset($this->urlMap[$shortenedUrl])) {
            return $this->urlMap[$shortenedUrl];
        } else {
            $this->urlMap[$shortenedUrl] = $url;
            return $shortenedUrl;
        }
    }

    public function restore($short) {
        if (!isset($this->urlMap[$short])) {
            return null;
        }
        return $this->urlMap[$short];
    }
}
```