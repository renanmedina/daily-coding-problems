```php
public function reverseList($head) {
    $prev = null;
    while ($head !== null) {
        $nextNode = $head->next;
        $head->next = $prev;
        $prev = $head;
        $head = $nextNode;
    }
    return $prev;
}
```