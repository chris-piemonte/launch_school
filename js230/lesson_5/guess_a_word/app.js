document.addEventListener('DOMContentLoaded', () => {
  const message = document.querySelector('#message');
  const letters = document.querySelector('#spaces');

  class Game {
    static #GUESSES_ALLOWED = 6;
    #words;
    #currentWord;
    #lettersGuessed;
    #incorrectGuesses;
    #lettersElements;

    constructor() {
      this.#words = ['apple', 'banana', 'orange', 'pear'];
      this.keydown = this.keydown.bind(this);
      this.newGameListener = this.newGameListener.bind(this);
      this.resetGame();
    }

    get lettersGuessed() {
      return this.#lettersGuessed;
    }

    #selectRandomWord() {
      const word = this.#words[Math.floor(Math.random() * this.#words.length)];
      this.#words.splice(this.#words.indexOf(word), 1);
      return word;
    }

    #createSpaces() {
      letters.querySelectorAll('span').forEach(span => span.parentNode.removeChild(span));

      let count = this.#currentWord.length;
      while (count > 0) {
        letters.appendChild(document.createElement('span'));
        count -= 1;
      }
    }

    #createLettersArray() {
      this.#lettersElements = Array.from(document.querySelectorAll('#spaces span'));
    }

    #removeGuesses() {
      document.querySelectorAll('#guesses span').forEach(span => span.parentNode.removeChild(span));
    }

    addLetterToGuesses(letter) {
      this.#lettersGuessed.push(letter);
      const newGuess = document.createElement('span');
      newGuess.textContent = letter;
      document.querySelector('#guesses').appendChild(newGuess);
    }

    correctGuess(letter) {
      return this.#currentWord.includes(letter)
    }

    addLetterToWord(letter) {
      const indeces = [];
      let index = 0;
      while (true) {
        index = this.#currentWord.indexOf(letter, index)
        if (index === -1) break;
        indeces.push(index);
        index += 1;
      }

      indeces.forEach(ind => {
        this.#lettersElements[ind].textContent = letter;
      });

      if (this.#lettersElements.filter(span => span.textContent === '').length === 0) {
        this.winGame();
      }
    }

    incorrectGuess() {
      this.#incorrectGuesses += 1;
      document.querySelector('#apples').className = 'guess_' + this.#incorrectGuesses;
      if (this.#incorrectGuesses === Game.#GUESSES_ALLOWED) this.loseGame();
    }

    loseGame() {
      this.displayMessage("You're out of tries, game over!");
      document.querySelector('body').className = 'lose'
      document.removeEventListener('keydown', this.keydown);
      this.#revealNewGame();
    }

    winGame() {
      this.displayMessage("You Win! :3");
      document.querySelector('body').className = 'win'
      document.removeEventListener('keydown', this.keydown);
      this.#revealNewGame();
    }

    displayMessage(text) {
      message.textContent = text;
    }

    #revealNewGame() {
      const newGame = document.createElement('a');
      newGame.href = '#';
      newGame.textContent = 'PLAY AGAIN';
      message.appendChild(newGame);
      newGame.addEventListener('click', this.newGameListener);
    }

    #hideNewGame() {
      document.querySelector('a').remove()
      message.textContent = '';
    }

    newGameListener(event) {
      event.preventDefault();
      this.resetGame();
    }

    resetGame() {
      if (this.#words.length === 0) {
        this.gameOver();
      } else {
        document.querySelector('body').className = '';
        document.querySelector('#apples').className = '';
        this.#currentWord = this.#selectRandomWord();
        this.#lettersGuessed = [];
        this.#incorrectGuesses = 0;
        this.#createSpaces();
        this.#createLettersArray();
        this.#removeGuesses();
        if (document.querySelector('a')) this.#hideNewGame();
        document.addEventListener('keydown', this.keydown);
      }
    }

    gameOver() {
      message.textContent = "There's no more words to guess, sorry!"
    }

    keydown(event) {
      const letter = event.key.toLowerCase();
      if (letter.length !== 1 ||
          !/[a-z]/i.test(letter) ||
          this.#lettersGuessed.includes(letter)) return;
  
      this.addLetterToGuesses(letter);
  
      if (this.correctGuess(letter)) {
        this.addLetterToWord(letter);
      } else {
        this.incorrectGuess();
      }
    }
  }

  const game = new Game();
});
