```php
<?php
function spiralOrder($matrix) {
    if (empty($matrix)) {
        return [];
    }

    $rowStart = 0;
    $rowEnd = count($matrix);
    $colStart = 0;
    $colEnd = count($matrix[0]);

    $result = [];

    while ($rowStart < $rowEnd && $colStart < $colEnd) {
        // Traverse from left to right
        for ($i = $colStart; $i < $colEnd; $i++) {
            array_push($result, $matrix[$rowStart][$i]);
        }
        $rowStart++;

        // Traverse from top to bottom
        for ($i = $rowStart; $i < $rowEnd; $i++) {
            array_push($result, $matrix[$i][$colEnd - 1]);
        }
        $colEnd--;

        // Traverse from right to left
        if ($rowStart < $rowEnd) {
            for ($i = $colEnd - 1; $i >= $colStart; $i--) {
                array_push($result, $matrix[$rowEnd - 1][$i]);
            }
            $rowEnd--;
        }

        // Traverse from bottom to top
        if ($colStart < $colEnd) {
            for ($i = $rowEnd - 1; $i >= $rowStart; $i--) {
                array_push($result, $matrix[$i][$colStart]);
            }
            $colStart++;
        }
    }

    return $result;
}
```