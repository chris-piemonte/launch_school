// You are given a grid represented as a
// nested array filled with strings.

// Chaos is standing at the top-left corner of
// the grid and can move either down or right at
// any point in time. However, there are sleeping
// cats in certain squares, represented by the
// letter "C" in the grid, and Chaos cannot go through
// these squares.

// Determine the number of distinct paths Chaos
// can take to reach a bowl of treats placed at
// the bottom-right corner of the grid.

// Define a function `chaosInTheGridWithCats` that,
// given a nested array, returns the number of
// unique paths that Chaos can take to reach the
//  bottom-right corner.

// The grid will have at least 1 row and 1 column.

// Example:

// Given the following 2x3 grid:

// const grid = [
//   ["", "C", ""],
//   ["", "", ""],
// ];

// There is only one distinct path Chaos can take:
// 1. Down -> Right -> Right

function chaosInTheGridWithCats(grid) {
  const rows = grid.length;
  const cols = grid[0].length;

  for (let i = 0; i < rows; i += 1) {
    if (grid[i][0] !== 'C') {
      grid[i][0] = 1;
    } else {
      for (let j = i; j < rows; j += 1) {
        grid[j][0] = 0;
      }
      break;
    }
  }

  for (let i = 0; i < cols; i += 1) {
    if (grid[0][i] !== 'C') {
      grid[0][i] = 1;
    } else {
      for (let j = i; j < cols; j += 1) {
        grid[0][j] = 0;
      }
      break;
    }
  }

  for (let row = 1; row < rows; row += 1) {
    for (let col = 1; col < cols; col += 1) {
      if (grid[row][col] === 'C') {
        grid[row][col] = 0;
      } else {
        grid[row][col] = grid[row][col - 1] + grid[row - 1][col];
      }
    }
  }

  return(grid[rows - 1][cols - 1]);
}

function chaosInTheGridWithCats(grid) {
  const bottomRight = [grid.length - 1, grid[0].length - 1];
  const memo = new Map();

  function paths(square) {
    if (memo.get(String(square))) return memo.get(String(square));

    if (grid[square[0]][square[1]] === 'C') {
      memo.set(String(square), 0);
      return memo.get(String(square));
    }

    if (square[0] === 0) {
      if (grid[0].slice(0, square[1] + 1).includes('C')) {
        memo.set(String(square), 0);
      } else {
        memo.set(String(square), 1);
      }
      return memo.get(String(square));
    }

    if (square[1] === 0) {
      for (let i = 0; i < grid.length; i += 1) {
        if (grid[i][0] === 'C') {
          memo.set(String(square), 0);
          break;
        }
      }
      if (!memo.get(String(square))) memo.set(String(square), 1);
      return memo.get(String(square));
    }

    memo.set(String(square), paths([square[0], square[1] - 1]) + paths([square[0] - 1, square[1]]));
    return memo.get(String(square));
  }

  return paths(bottomRight);
}

// Test Cases:

const grid1 = [
  ["", "C"],
  ["", ""],
];
const grid2 = [["", "C"]];
const grid3 = [
  ["", "", ""],
  ["", "C", ""],
  ["", "", ""],
];
const grid4 = [
  ["", "", "", "", "C"],
  ["", "C", "", "", ""],
  ["", "", "", "C", ""],
];
const grid5 = [
  ["", "", "", "", "C", ""],
  ["", "C", "", "", "", ""],
  ["", "", "", "", "", ""],
  ["", "", "", "C", "", ""],
  ["", "C", "", "", "", ""],
  ["", "", "", "", "", ""],
];

console.log(chaosInTheGridWithCats(grid1) === 1);
console.log(chaosInTheGridWithCats(grid2) === 0);
console.log(chaosInTheGridWithCats(grid3) === 2);
console.log(chaosInTheGridWithCats(grid4) === 2);
console.log(chaosInTheGridWithCats(grid5) === 43);
