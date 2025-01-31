let rlsync = require('readline-sync');

class Game {
  constructor() {
    this.board = new Board();
    this.scoreboard = new Scoreboard();
    this.human = new Human();
    this.computer = new Computer();
  }

  introGame() {
    console.clear();
    console.log('Welcome to Tic-Tac-Toe!');
    rlsync.question(`Press enter when you're ready to start.`)
  }

  gameLoop() {
    while (true) {
      this.humanTurn();
      let gameOver = this.checkGameOver(this.human)
      if (gameOver) return gameOver;

      this.computerTurn();
      gameOver = this.checkGameOver(this.computer)
      if (gameOver) return gameOver;
    }
  }

  checkGameOver(player) {
    if (player.checkIfWinner(this.board)) {
      return player;
    } else if (this.checkTie()) {
      return 'tie';
    } else {
      return false;
    }
  }

  humanChoice() {
    let choice;
    while (true) {
      console.log('Please choose an available square');
      choice = rlsync.question(`Available squares: ${this.board.availableSquares().join(' ')}\n`);

      if (this.board.availableSquares().includes(choice)) {
        return choice
      }

      console.log("I'm sorry, that is not an available square.")
    }
  }

  computerChoice() {
    rlsync.question('The computer will choose from the vailable squares:\n' +
                    `${this.board.availableSquares().join(' ')}\n\n` +
                    "Press any key when you're ready for the computer to take its turn.");

    const choices = this.board.availableSquares()
    return choices[Math.floor(Math.random() * choices.length)]
  }

  humanTurn() {
    const choice = this.humanChoice();
    console.clear();
    this.board.updateBoard(this.human, choice);
    console.log(`You chose square ${choice}\n`);
    this.board.displayBoard();
  }

  computerTurn() {
    const choice = this.computerChoice();
    console.clear();
    this.board.updateBoard(this.computer, choice);
    console.log(`The computer chose square ${choice}\n`);
    this.board.displayBoard();
  }

  checkTie() {
    if (this.board.availableSquares().length === 0) {
      return true;
    } else  {
      return false;
    }
  }

  displayWinner(winner) {
    if (winner instanceof Human) {
      console.log('You win!');
    } else if (winner instanceof Computer) {
      console.log('The computer wins!');
    } else {
      console.log("No one wins, it's a tie :(");
    }
  }

  startGame() {
    console.clear();
    this.board.displayBoard();
    const winner = this.gameLoop();
    this.endGame(winner);
  }

  endGame(winner) {
    this.scoreboard.incrementScore(winner);
    this.displayWinner(winner);
    this.scoreboard.displayScore();
    this.askPlayAgain();
  }


  askPlayAgain() {
    const answer = rlsync.question('Do you want to play again? (y/n)\n').toLowerCase();
    if (answer === 'y' || answer === 'yes') {
      this.resetGame();
    } else {
      console.log('Thanks for playing, goodbye!');
    }
  }

  resetGame() {
    this.board.reset();
    this.startGame();
  }

  play() {
    this.introGame();
    this.startGame();
  }
}

class Board {
  constructor() {
    this.squares = {1: ' ', 2: ' ', 3: ' ', 4: ' ', 5: ' ', 6: ' ',
                    7: ' ', 8: ' ', 9: ' '};
    this.winningCombos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8],
                          [3, 6, 9], [1, 5, 9], [3, 5, 7]];
  }

  displayBoard() {
    console.log(`     |     |     `);
    console.log(`  ${this.squares[1]}  |  ${this.squares[2]}  |  ${this.squares[3]}  `);
    console.log(`     |     |     `);
    console.log(`-----+-----+-----`);
    console.log(`     |     |     `);
    console.log(`  ${this.squares[4]}  |  ${this.squares[5]}  |  ${this.squares[6]}  `);
    console.log(`     |     |     `);
    console.log(`-----+-----+-----`);
    console.log(`     |     |     `);
    console.log(`  ${this.squares[7]}  |  ${this.squares[8]}  |  ${this.squares[9]}  `);
    console.log(`     |     |     `);
  }

  availableSquares() {
    return Object.keys(this.squares).filter(square => {
      return this.squares[square] === ' ';
    });
  }

  updateBoard(player, square) {
    this.squares[square] = player.marker;
  }

  reset() {
    this.squares = {1: ' ', 2: ' ', 3: ' ', 4: ' ', 5: ' ', 6: ' ', 7: ' ',
                    8: ' ', 9: ' '};
  }
}

class Scoreboard {
  constructor() {
    this.humanScore = 0;
    this.computerScore = 0;
  }

  incrementScore(player) {
    if (player instanceof Human) {
      this.humanScore += 1;
    } else if (player instanceof Computer) {
      this.computerScore += 1;
    }
  }

  displayScore() {
    console.log(`Human's score is ${this.humanScore}`);
    console.log(`Computer's score is ${this.computerScore}`);
  }

  // Only use if want option to reset entire game & score
  // reset() {
  //   this.humanScore = 0;
  //   this.computerScore = 0;
  // }
}

class Player {
  constructor(marker) {
    this.marker = marker;
  }

  checkIfWinner(board) {
    for (let combo of board.winningCombos) {
      if (combo.every(square => board.squares[square] === this.marker)) {
        return true;
      }
    }
    return false;
  }
}

class Human extends Player {
  constructor() {
    super('X')
  }
}

class Computer extends Player{
  constructor() {
    super('O')
  }
}

let game = new Game();
game.play();
