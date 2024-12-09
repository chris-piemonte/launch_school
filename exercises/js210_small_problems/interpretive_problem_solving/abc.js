/*

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument and returns true if the word can be spelled using the set of blocks, false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

---PROBLEM---
input: string of characters
output: boolean true/false

---DATA---
- array of subarrays of letter pairs

rules:
  - can input string be spelled using each block only once
    - no repeat letters
    - no 2 letters form any 1 block
    - no letter can be used more than once
  - case insensitive
  - non-alphabetic characters allowed
  - input string can be empty string
    - return true
  - input string can have no characters
    - return true
  - will always be an argument
  - onle ever 1 argument

---ALGORITHM---
- create an array of sub-arrays of letter blocks
  - create array of characters called `chars`

- iterate through string, check if any letter is used more than once, return false if so
  - create new string of just letters, using regex
    - replace any charaters in input string that aren't letters (case insensitive) w/ ''
  - create a for loop to iterate through input string using indexing - set counter to 0, while counter < new string length, counter += 1
    - index input string at the counter
    - split string into array of characters, filter for string char at index (case insensitive), if length > 1 return false

- iterate through array of sub-arrays, check if both letters in each sub-array are in input string, return false if so
  - create for loop - set counter to 0, while counter < array length, increment counter by 1
    - create if conditional
      - if input string includes sub-array element 0 & element 1, return false

- if haven't returned false in previous steps, return true

*/

function isBlockWord(input) {
  input = input.toUpperCase();
  const blocks = [ ['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'], ['G','T'], ['R','E'],   ['F','S'],   ['J','W'],   ['H','U'], ['V','I'],   ['L','Y'],   ['Z','M'] ]

  let justLetters = input.replace(/[^a-z]/gi, '');

  // for (let charInd = 0; charInd < justLetters.length; charInd += 1) {
  //   if ([...justLetters].filter(char => char === input[charInd]).length > 1) return false;
  // }

  for (let charInd = 0; charInd < justLetters.length; charInd += 1) {
    let letterCounter = 0;
    for (let strInd = 0; strInd < justLetters.length; strInd += 1) {
      if (justLetters[charInd] === justLetters[strInd]) letterCounter += 1
    }
    if (letterCounter > 1) return false;
  }

  for (let ind = 0; ind < blocks.length; ind += 1) {
    if (input.includes(blocks[ind][0]) && input.includes(blocks[ind][1])) {
      return false;
    }
  }

  return true;
}

// console.log(isBlockWord('BATCH'));      // true
// console.log(isBlockWord('BUTCH'));      // false
// console.log(isBlockWord('jest'));       // true
// console.log(isBlockWord('jestj'));       // false
// console.log(isBlockWord(''));       // true
// console.log(isBlockWord('2378623587'));       // true
// console.log(isBlockWord('BA23432TC234234H'));      // true

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
// console.log(isBlockWord('jest'));       // true
// console.log(isBlockWord('floW'));       // true
// console.log(isBlockWord('APPLE'));      // false
// console.log(isBlockWord('apple'));      // false
// console.log(isBlockWord('apPLE'));      // false
// console.log(isBlockWord('Box'));        // false

function isBlockWord(word) {
  const blocks = ['B:O', 'X:K', 'D:Q', 'C:P', 'N:A', 'G:T', 'R:E', 'F:S', 'J:W', 'H:U', 'V:I', 'L:Y', 'Z:M'];
  const regExps = blocks.map(block => new RegExp(block.replace(':', '|'), 'gi'));
  console.log(regExps);

  return regExps.every(regExp => {
    console.log(word.match(regExp) || []);
    return (word.match(regExp) || []).length < 2;
  })
}
