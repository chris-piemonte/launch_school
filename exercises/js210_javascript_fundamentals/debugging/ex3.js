const readLine = require('readline-sync');

function placeABet(guess) {
  (function generateRandomInt() {
    return Math.floor(Math.random() * 25) + 1;
  });

  const winningNumber = generateRandomInt();

  if (guess < 1 || guess > 25) {
    return 'Invalid guess. Valid guesses are between 1 and 25.';
  }

  if (guess === winningNumber) {
    return "Congratulations, you win!";
  } else {
    return "Wrong-o! You lose.";
  }
}

const userGuess = parseInt(readLine.question('Input a guess between 1-25'), 10);
console.log(placeABet(userGuess));

// the function generateRandomInt() on line 4 is a function expression because of the parentheses so it is not defined to a variable that can be cakked outside itself
