```php
<?php

class Solution {
    function minMeetingRooms($intervals) {
        if (empty($intervals)) {
            return 0;
        }

        usort($intervals, function ($a, $b) {
            return $a[0] - $b[0];
        });

        $rooms = array();
        foreach ($intervals as $interval) {
            $start = $interval[0];
            $end = $interval[1];

            // Find the index of a room with a start time that is greater than or equal to $start
            $idx = null;
            foreach ($rooms as $i => $room) {
                if ($room['end'] >= $start) {
                    $idx = $i;
                    break;
                }
            }

            // If we found an index, schedule the interval in that room
            if ($idx !== null) {
                $rooms[$idx] = array('start' => min($room['start'], $start), 'end' => max($room['end'], $end));
            } else {  // Otherwise, create a new room for this interval
                array_push($rooms, array('start' => $start, 'end' => $end));
            }
        }

        return count($rooms);
    }
}

?>
```