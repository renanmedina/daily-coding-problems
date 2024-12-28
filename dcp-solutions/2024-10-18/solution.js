```javascript
class GameOfLife {
    constructor(liveCells, steps) {
        this.liveCells = liveCells;
        this.steps = steps;
        this.board = this.initializeBoard();
    }

    initializeBoard() {
        const minX = Math.min(...this.liveCells.map(cell => cell[0]));
        const minY = Math.min(...this.liveCells.map(cell => cell[1]));
        const maxX = Math.max(...this.liveCells.map(cell => cell[0])) + 1;
        const maxY = Math.max(...this.liveCells.map(cell => cell[1])) + 1;

        let board = [];
        for (let i = minY; i < maxY; i++) {
            board.push([]);
            for (let j = minX; j < maxX; j++) {
                board[i].push('.');
            }
        }

        this.liveCells.forEach((cell) => {
            const xIndex = cell[0] - minX;
            const yIndex = cell[1] - minY;
            board[yIndex][xIndex] = '*';
        });

        return board;
    }

    nextGeneration() {
        let newBoard = [];
        for (let i = 0; i < this.board.length; i++) {
            newBoard.push([]);
            for (let j = 0; j < this.board[i].length; j++) {
                newBoard[i].push('.');
            }
        }

        const minX = Math.min(...this.liveCells.map(cell => cell[0]));
        const minY = Math.min(...this.liveCells.map(cell => cell[1]));
        const maxX = Math.max(...this.liveCells.map(cell => cell[0])) + 1;
        const maxY = Math.max(...this.liveCells.map(cell => cell[1])) + 1;

        for (let i = 0; i < this.board.length; i++) {
            for (let j = 0; j < this.board[i].length; j++) {
                let aliveNeighbours = 0;
                if (i > 0 && j > 0) aliveNeighbours++;
                if (i > 0 && j < this.board[i].length - 1) aliveNeighbours++;
                if (i < this.board.length - 1 && j > 0) aliveNeighbours++;
                if (i < this.board.length - 1 && j < this.board[i].length - 1) aliveNeighbours++;
                if (i < this.board.length - 1 && j === this.board[i].length - 1) aliveNeighbours++;
                if (j > 0 && i < this.board.length - 1) aliveNeighbours++;
                if (j < this.board[i].length - 1 && i < this.board.length - 1) aliveNeighbours++;

                if (this.board[i][j] === '*' && (aliveNeighbours < 2 || aliveNeighbours > 3)) {
                    newBoard[i][j] = '.';
                } else if (this.board[i][j] === '.' && aliveNeighbours === 3) {
                    newBoard[i][j] = '*';
                }
            }
        }

        this.board = newBoard;
    }

    run() {
        for (let i = 0; i < this.steps; i++) {
            console.log(this.board.map(row => row.join('')).join('\n'));
            this.nextGeneration();
        }
    }
}

```