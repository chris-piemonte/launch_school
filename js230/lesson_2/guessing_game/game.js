document.addEventListener('DOMContentLoaded', () => {
  function newGame() {
    let answer = Math.floor(Math.random() * 100) + 1;
    document.querySelector('p').textContent = "Guess a number from 1 - 100";
    let input = document.querySelector('#guess');
    let form = document.querySelector('form');
    let counter = 0;
    let guessButton = document.querySelector('[type="submit"]');
    guessButton.disabled = false;

    form.addEventListener('submit', event => {
      event.preventDefault();
      counter += 1;
      let guess = parseInt(input.value, 10);
      let message;

      if (Number.isNaN(guess) || guess < 1 || guess > 100) {
        message = "Invalid guess, guess must be integer beween 1 & 100"
      }  else if (guess > answer) {
        message = `The answer is lower than the ${guess}`;
      } else if (guess < answer) {
        message = `The answer is higher than the ${guess}`
      } else if (guess === answer) {
        message = `Your guess is correct! You took ${counter} guesses`;
        guessButton.disabled = true;
      }

      document.querySelector('p').textContent = message;
    });

    document.querySelector('a').addEventListener('click', () => {
      newGame();
    });
  }

  newGame();
});
