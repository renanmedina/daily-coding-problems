```php
<?php
function permute($nums) {
    if (count($nums) == 1) {
        return [$nums];
    }

    $result = [];
    for ($i = 0; $i < count($nums); $i++) {
        $currentNum = $nums[$i];
        $restNumbers = array_merge(array_slice($nums, 0, $i), array_slice($nums, $i + 1));
        foreach (permute($restNumbers) as $permutation) {
            $result[] = array_merge([$currentNum], $permutation);
        }
    }

    return $result;
}
```