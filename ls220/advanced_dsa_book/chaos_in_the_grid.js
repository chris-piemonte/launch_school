/*

---PROBLEM---
input: matrix
output: integer of how many unique paths you can take from top left of matrix to bottom right

rules:
- can only move right and down
- all of the first row & column squares have 1 path
- each other square's paths can be calculated by adding the paths to the squares directly above and to the left of it

---DATA--- 
- recursion

---ALGORITHM---
- set the 

*/

function chaosInTheGrid(grid) {
  const bottomRight = [grid.length - 1, grid[0].length - 1];
  const memo = new Map();

  function paths(square) {
    if (square[0] === 0 || square[1] === 0) return 1;
    if (memo.get(String(square))) {
      return memo.get(String(square));
    }
  
    memo.set(String(square), paths([square[0], square[1] - 1]) + paths([square[0] - 1, square[1]]));
    return memo.get(String(square));
  }

  return paths(bottomRight);
}

const grid1 = [[""]];
const grid2 = [
  ["", ""],
  ["", ""],
];
const grid3 = [
  ["", "", ""],
  ["", "", ""],
  ["", "", ""],
];
const grid4 = [
  ["", "", "", "", ""],
  ["", "", "", "", ""],
  ["", "", "", "", ""],
];
const grid5 = [
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "", "", ""],
];

console.log(chaosInTheGrid(grid1) === 1);
console.log(chaosInTheGrid(grid2) === 2);
console.log(chaosInTheGrid(grid3) === 6);
console.log(chaosInTheGrid(grid4) === 15);
console.log(chaosInTheGrid(grid5) === 252);
