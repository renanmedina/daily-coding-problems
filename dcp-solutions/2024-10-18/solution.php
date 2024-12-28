```php
<?php

class GameOfLife {
    private $board;
    private $rows;
    private $cols;

    public function __construct($cells, $steps) {
        $this->board = array_fill(0, $cells[1], array_fill(0, $cells[2], false));
        foreach ($cells[0] as $cell) {
            $this->board[$cell[0]][$cell[1]] = true;
        }
        $this->rows = count($this->board);
        $this->cols = count($this->board[0]);
    }

    public function runSteps($steps) {
        for ($i = 0; $i < $steps; $i++) {
            $newBoard = array_fill(0, $this->rows, array_fill(0, $this->cols, false));
            for ($row = 0; $row < $this->rows; $row++) {
                for ($col = 0; $col < $this->cols; $col++) {
                    $liveNeighbors = $this->countLiveNeighbors($row, $col);
                    if ($this->board[$row][$col] && ($liveNeighbors < 2 || $liveNeighbors > 3)) {
                        $newBoard[$row][$col] = false;
                    } elseif (!$this->board[$row][$col] && $liveNeighbors == 3) {
                        $newBoard[$row][$col] = true;
                    }
                }
            }
            $this->board = $newBoard;
            foreach ($this->board as &$row) {
                echo implode(' ', $row) . "\n";
            }
        }
    }

    private function countLiveNeighbors($row, $col) {
        $rows = array(-1, -1, -1, 0, 0, 1, 1, 1);
        $cols = array(-1, 0, 1, -1, 1, -1, 0, 1);
        $count = 0;
        foreach ($rows as $r) {
            foreach ($cols as $c) {
                if (abs($row + $r) < $this->rows && abs($col + $c) < $this->cols && $this->board[$row + $r][$col + $c]) {
                    $count++;
                }
            }
        }
        return $count;
    }

}

?>
```