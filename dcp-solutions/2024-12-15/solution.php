```php
<?php
function permute($nums) {
    if (count($nums) == 1) {
        return [$nums];
    }

    $result = [];
    for ($i = 0; $i < count($nums); $i++) {
        $current = $nums[$i];
        $rest = array_merge(array_slice($nums, 0, $i), array_slice($nums, $i + 1));
        foreach (permute($rest) as &$p) {
            $p = array_merge([$current], $p);
            $result[] = $p;
        }
    }

    return $result;
}
```