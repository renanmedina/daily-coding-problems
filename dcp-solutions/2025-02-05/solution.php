```php
<?php
class GrayCode {
    public static function generate($n) {
        $gray = array();
        if ($n == 0) return $gray;
        
        $gray[] = bin2hex(1);
        self::generateHelper($n-1, $gray, '0', '1');
        for($i = count($gray)-1; $i >= 0 ;$i--){
            $gray[$i] = strrev($gray[$i]);
        }
        return $gray;
    }

    private static function generateHelper($n, &$gray, $prevZero, $prevOne) {
        if ($n == 0) return;
        
        for ($i = 0; $i < pow(2,$n); $i++) {
            $newZero = dechex($i^$prevZero);
            $newOne = dechex($i^$prevOne);
            $gray[] = bin2hex($newZero . $newOne);
        }
        
        self::generateHelper($n-1, $gray, $newOne, $newZero);
    }

}

// usage
print_r(GrayCode::generate(2));
```