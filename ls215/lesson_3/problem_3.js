/*
A collection of spelling blocks has two letters per block, as shown in this list:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

---PROBLEM---
input: word string
output: true/false depending on if word can be spelled w/o using more than one letter one time total from each block

rules:
  - case insensitive
  - input string can be spelled fom using each block maximum of 1 tiimes
    - cannot use both letters from the block
    - cannot usse a letter from the block twice
      - words cannot have multiples of any letter
  - ignore any non-letters in a string

Question:
  - can the argument string contain anything except letters
  - can the input be more than one argument
    - what if first argument isn't string and second is
  - can the input be an empty string? What result?
    - what if it's a string with no letters?
  - can the input be a non-string
  - can there be no arguments at all

---ALGORITHM---
1. Check if the input isn't a string
  - if it isn't, return undefined
2. Create an array of the string with letter characters
  - capitalize all the letters in the string
  - filter the string to an array of just letters with regex
3. If the array is empty, return false
  - rejoin the array into a string
4. Validate if the array of letters works with the blocks
  - use validateWord(array) helper method

HELPER: validateWord(array)
  - create a constant array `blocks` with the blocks as comma separated sub-arrays
  - use a for loop to iterate through `blocks` w/ the initializer set to 0, while initializer < array's length, increment initializer by 1
    - create a variable `count` set to 0
    - iterate through each `BLOCKS` sub-array
      - for each element of the sub-array
        - create an array of characters from string that match subarray element
        - add string to `count` 
    - if `count` > 1, return false
  - if for loop ends, return true
*/

function isBlockWord(string) {
  if (typeof string !== 'string') return undefined;

  let charsArray = [...string].map(char => char.toUpperCase());
  charsArray = charsArray.filter(char => /[A-Z]/.test(char));

  if (charsArray.length < 1) return false;

  charsString = charsArray.join('');
  return validateWord(charsString);
}

function validateWord(string) {
  const BLOCKS = [
    ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U',], ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ]

  for (let blocksInd = 0; blocksInd < BLOCKS.length; blocksInd += 1) {
    let count = 0;
    [...string].forEach(char => {
      if (char === BLOCKS[blocksInd][0]) count += 1;
      if (char === BLOCKS[blocksInd][1]) count += 1;
    });

    if (count > 1) return false;
  }

  return true;
}

// // True
console.log(isBlockWord('BATCH') === true);      // true
console.log(isBlockWord('jest') === true);       // true
console.log(isBlockWord('jEsT') === true);       // true
console.log(isBlockWord('chris') === true);       // true
console.log(isBlockWord('BkDpNgEfJhVlZ') === true);       // true
console.log(isBlockWord('B   A   T$#CH^&') === true);      // true

// False
console.log(isBlockWord('BUTCH') === false);      // false
console.log(isBlockWord('') === false);      // false
console.log(isBlockWord('bo') === false);      // false
console.log(isBlockWord('XK') === false);      // false
console.log(isBlockWord('BkDpNgEfJhVlbZ') === false);      // false
console.log(isBlockWord('15245132') === false);      // false
console.log(isBlockWord('aa') === false);      // false

// Undefined
console.log(isBlockWord() === undefined);      // undefined
console.log(isBlockWord(['BUTCH']) === undefined);      // undefined
console.log(isBlockWord(1, 'BATCH') === undefined);      // undefined
