/*
In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal. Positions on the board equate to coordinate numbers. Given a set up like so:

_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _

The white queen's position equates to (2, 3) and the black queen is at (5, 6). In this example the queens are on the same diagonal, and therefore can attack each other.

Write a function which, given a string representation of the board with the two queens, returns true or false depending on whether the queens can attack each other or not.

---PROBLEM---
- Input:
  - string respresentation of a board with 2 queens
- Output:
  - true/false boolean based on if the queens can attack each other

- Rules
  - queen's coordinates are represented as (row, column)
    - first row and column are 0 indexes
  - queens can attack each other it:
    - same row coordiniates
    - same column coordinates
    - same diagnol
      - the difference between the 2 rows cordinates and column coordinates are the same
  - 8 x 8 board
    - indexes 0 - 7
  - only 1 of each color queen on board
  - no other pieces on board
  - if either queen is missing return `undefined`
  - will always be provided board
  - input will be one string
    - will have \n characters at the end of each row
    - queens will be represented by 'B' & 'W'
    - empty spacces can be respresented by underscores

---DATA STRUCTURE---
Board:
[
  "________",
  "__B_____",
  "________",
  "________",
  "_____W__",
  "________",
  "________",
  "________",
]

Coordinates:
[row, column] => [2, 3]

---ALGORITHM---

High Level:
1. Break input string into array of row strings
2. Determine if the queens are in each array row/element, return coordinates
2a. Return `undefined` if either queen missing
3. Determine if queens can attack each other based on coordinates
3. Return true or false

Detailed:
1. Break input string into array of row strings
  - create a variable `board` equal to the input string split by `\n` values
2. Determine if the queens are in each array row/element, return coordinates
  - initialize variable `coordinates`, set equal to passing `board` into `queenCoordinates(board)` helper method
  2a. Return `undefined` if either queen missing
    - if `coordinates` doesn't have both 'B' and 'W' return `undefined`
3. Determine if queens can attack each other based on coordinates
  - Pass `coordinates` into helper method `queensCanAttack(coordinates)`
    - return the return value of method, true or false

HELPER: queenCoordinates(board) => {B: [x, y], W: [x, y]}
  - initialize empty object `coordinates`
  - iterate through each element in `board` with both element and index parameters
    - iterate through each character in the element with both element and index parameters
      - if 'B' is found:
        - add 'B' key to `coordinates', set equal to [element index, character index]
      - if 'W' is found:
        - add 'W' key to `coordinates', set equal to [element index, character index]
  - return `coordinates`

HELPER: queensCanAttack(coordinates) => true or false
1. turn `coordiniates` into an array w/ coordinates in sub-arrays
2. check if queens can attack
  - if the row coordinates are the same, return true
  - if the column coordinates are the same, return true
  - if the absolute value of the difference between the column coordiniates and the absolute value of the difference between the row coordinates are the same, return true
  - else return false

*/

function queenAttack(board) {
  board = board.split('\n');

  let coordinates = queenCoordinates(board);
  if (coordinates.B === undefined || coordinates.W === undefined) return undefined;

  return queensAttack(coordinates);
}

function queenCoordinates(board) {
  let coordinates = {};

  board.forEach((row, rowInd) => {
    [...row].forEach((char, colInd) => {
      if (char === 'B') coordinates.B = [rowInd, colInd];
      if (char === 'W') coordinates.W = [rowInd, colInd];
    });
  });

  return coordinates;
}

function queensAttack(coordinates) {
  coordinates = Object.values(coordinates);

  if (coordinates[0][0] === coordinates[1][0]) {
    return true;
  } else if (coordinates[0][1] === coordinates[1][1]) {
    return true;
  } else if (Math.abs(coordinates[0][0] - coordinates[1][0]) === Math.abs(coordinates[0][1] - coordinates[1][1])) {
    return true;
  }

  return false
}

//Diagnol Attack
console.log(queenAttack("________\n" +
                        "________\n" +
                        "__B_____\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "______W_\n" +
                        "________\n" ) === true);

console.log(queenAttack("________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "_B______\n" +
                        "W_______\n" ) === true);

console.log(queenAttack("B_______\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "_______W\n" ) === true);

console.log(queenAttack("________\n" +
                        "____B___\n" +
                        "________\n" +
                        "________\n" +
                        "_W______\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === true);

// Column Attack
console.log(queenAttack("________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "B_______\n" +
                        "W_______\n" ) === true);

console.log(queenAttack("_______W\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "_______B\n" ) === true);

console.log(queenAttack("________\n" +
                        "____B___\n" +
                        "________\n" +
                        "________\n" +
                        "____W___\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === true);

// Row Attack
console.log(queenAttack("________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "WB______\n" ) === true);

console.log(queenAttack("B______W\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === true);

console.log(queenAttack("________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "____W_B_\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === true);

// No Attack
console.log(queenAttack("________\n" +
                        "_______B\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "W_______\n" ) === false);

console.log(queenAttack("B_______\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "___W____\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === false);

console.log(queenAttack("________\n" +
                        "________\n" +
                        "_W______\n" +
                        "________\n" +
                        "______B_\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === false);

// Missing Pieces
console.log(queenAttack("________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "W_______\n" ) === undefined);

console.log(queenAttack("________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "___W____\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === undefined);

console.log(queenAttack("________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" +
                        "________\n" ) === undefined);
