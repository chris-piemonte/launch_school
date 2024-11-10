const readSync = require('readline-sync');

let password = 'password';
let guesses = [];
let guessesAllowed = 3;

while (guesses.length < guessesAllowed) {
  guesses.push(readSync.question("What's the password? \n"));
  if (guesses[guesses.length - 1] === password) return console.log("You have successfully logged in.");
}

console.log("You have been denied access.");
