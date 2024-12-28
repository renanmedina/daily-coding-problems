### PHP Solution
```php
function numKnightTours($n) {
    $dp = array_fill(0, 8*$n*($n-1), -1);
    $moves = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]];
    
    return numTours(0, $dp, $n, 0, $moves);
}

function numTours($pos, &$dp, $n, $knight_x, $knight_y) {
    if ($dp[$pos] != -1) return $dp[$pos];
    if ($pos >= (8*$n*($n-1)) / 2) return 1;
    
    foreach ($moves as $move) {
        list($nx, $ny) = [$knight_x + $move[0], $knight_y + $move[1]];
        
        if (!isValidMove($nx, $ny, $n)) continue;
        $newPos = (($nx % 8) * ($n*8) + (($ny % $n)*$n) + ($pos/($n*$n)));
        $dp[$newPos] = numTours($newPos, $dp, $n, $knight_x, $knight_y);
    }
    
    return $dp[$pos] = 1 + array_sum(array_slice($dp, (8*($n*$n)/2) + 1));
}

function isValidMove($x, $y, $n) {
    return ($x >= 0 && $x < $n && $y >= 0 && $y < $n);
}
```