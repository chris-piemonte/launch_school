/*
Implement encoding for the rail fence cipher.

The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which it's encoded. It was already used by the ancient Greeks.

In the Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zig-zag). Finally the message is then read off in rows.

For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE", the cipherer writes out:
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .

Then reads off:
WECRLTEERDSOEEFEAOCAIVDEN

---ALGORITHM---
- Take a string to be cyphered and the number of rows to use as argument
- if the message isn't a string or is an empty string, return undefined
- if the rows argument isn't an integer or is negative or empty, return undefined
- create an array with sub arrays of the amount that matches the number of rows to use
  - create an array called `cypher`
  - create a for loop from 0 - # of rows times
    - push a new empty sub-array into `cypher`
- push each cahracter of the input string into the corresponding sub arrays in-order one at a time until entire string looped
  - replace any spacses in the message with empty strings
  - make entier message uppercase
    - if message length is 0 return undefined
  - split the message into an array of characters
  - create a loop while message.length > 0
    - create a loop from 0 to `rows`
      - break if message length === 0
      - remove first character of message, push to `cypher` subarray matching loop index
    - create a loop from `rows` - 1 to 0
      - break if message length === 0
      - remove first character of message, push to `cypher` subarray matching loop index
- return the array of sub arrays as strings put together
  - flatten cypher
  - join together to string with no delimeter
  - return
*/

function createCypher(message, rows) {
  if (typeof message !== 'string' || message === '' ||
      typeof rows !== 'number' || rows % 1 !== 0) return undefined;
  
  let cypher = []
  for (let num = 1; num <= rows; num += 1) {
    cypher.push([]);
  }

  message = message.toUpperCase().replace(/\s+/g, '');
  if (message.length === 0) return undefined;
  let characters = [...message];

  cypher[0].push(characters.shift());

  while (characters.length > 0) {
    for (let ind = 1; ind < rows; ind += 1) {
      if (characters.length === 0) break;
      cypher[ind].push(characters.shift());
    }

    for (let ind = rows - 2; ind >= 0; ind -= 1) {
      if (characters.length === 0) break;
      cypher[ind].push(characters.shift());
    }
  }

  return cypher.flat().join('');
}


// console.log(createCypher("WE ARE DISCOVERED FLEE AT ONCE", 3) === 'WECRLTEERDSOEEFEAOCAIVDEN');
// console.log(createCypher("WE ARE DISCOVERED FLEE AT ONCE", 5) === 'WCLEESOFECAIVDENRDEEAOERT');


// undefined
// console.log(createCypher(1, 'string'));
// console.log(createCypher(4));
// console.log(createCypher('string'));
// console.log(createCypher('', 4));
// console.log(createCypher("WE ARE DISCOVERED FLEE AT ONCE", 3.1));

/*
Implement encoding for the rail fence cipher.

---PROBLEM---
input: coded string, number of rows in cypher
output: decoded message sring, no spaces

rules:
  - input will be a string that is encoded message, integer of how many rows was used to encode it
  - output will be string message decoded
    - no spaces?
  - number of rows determines how to decode message
    - 27 letters, 3 rows
      - 7 in first row
      - 13 in second row
      - 7 in third row
    - 26 letters, 3 rows
      - 7 in first row
      - 13 in second row
      - 6 in 3rd row
    - 25 letters, 3 rows
      - 7 in first row
      - 12 in second row
      - 6 in third row
    - 24 letters, 3 rows
      - 6 in first row
      - 12 in second
      - 6 in third row
    - 5 rows
      - row 1 gets integers 0, 8, 10
      - row 2 gets integers 1, 7, 9
  - rows can't be negative numbers or 0

  1
  2
  3
  4
  5
  6
  7

Questions:
  - WIll input always be a string message and integer row number?
    - What if arguments are reverses?
    - What if string is empty strings?
    - What if rows greater than string length?
    - What if rows is a float?
    - Can there be spaces?
    - Will there be characters other than letters? How to treat?
  - Do I need to account for spaces? How?
  - Does case matter for result?

---DATA---
- array of sub-arrays to put characters back in proper order
- array of characters of message to push to array of sub-arrays

---ALGORITHM---
- validate inputs
  - check if the first argument is a string
  - check if the second argument is an integer greater than 1
  - if not return undefined
- create an object `charsPerRow` to track how many characters go in each cypher row
  - create an empty object `charsPerRow`
  - create a loop from 0 to rows - 1 times
  - add the current loop number to `charsPerRow` as a key with 0 as the value
- create an empty array `rowsArrays`
  - create a loop from 0 to rows - 1 times
    - push empty arrays into `rowsArrays`
- determine how many characters go in each row
  - create a counter called `rowIndex` set to 0
  - create a variable called `increment` set to 'true'
  - create a loop from 0 to message's length - 1 number of times
    - increment `charsPerRow` at the key matching `rowIndex` by 1
    - increment `rowIndex`
      - if increment is true increment rowIndex by 1
      - if increment is false decrease rowIndex by 1
    - if rowIndex is 0 or rows - 1, switch increment (true/false) 
- push characters from message into sub-arrays in corrrect amounts
  - create an aray of the characters of the message called `messageChars`
  - create an array of the values of `charsPerRow`
    - iterate through it using element & index
      - push the element amont of charactrs from `messageChars` to `rowsArray` at the current index, destructively
- rejoin decoded message into string and return
  - create an empty string `decodedMessage`
  - reassign counter `rowIndex` set to 0
  - reassign variable `increment` to 'true'
  - create a loop from 0 to message's length - 1 number of times
    - shift the first element in `rowsArray` at the index `rowIndex`, concatenate to `decodedMessage`
    - increment `rowsIndex`
      - if increment is true increment rowIndex by 1
      - if increment is false decrease rowIndex by 1
    - if rowIndex is 0 or rows - 1, switch increment (true/false) 
  - return `decodedMessage`
*/

function decode(message, rows) {
  if (typeof message !== 'string' || message === '' ||
    typeof rows !== 'number' || rows % 1 !== 0 || rows <= 1) return undefined;

  let rowsArray = [];
  let charsPerRow = {};
  for (let num = 0; num < rows; num += 1) {
    charsPerRow[num] = 0;
  }

  let rowsIndex = 0;
  let increment = true;
  for (let ind = 0; ind < message.length; ind += 1) {
    charsPerRow[rowsIndex] += 1;
    if (increment) {
      rowsIndex += 1;
    } else {
      rowsIndex -= 1;
    }

    if (rowsIndex === 0 || rowsIndex === rows -1) increment = !increment;
  }

  let messageChars = [...message];
  Object.values(charsPerRow).forEach(num => {
    rowsArray.push(messageChars.splice(0, num));
  });

  let decodedMessage = '';
  rowsIndex = 0;
  increment = true;
  for (let ind = 0; ind < message.length; ind += 1) {
    decodedMessage += rowsArray[rowsIndex].shift()
    if (increment) {
      rowsIndex += 1;
    } else {
      rowsIndex -= 1;
    }

    if (rowsIndex === 0 || rowsIndex === rows -1) increment = !increment;
  }

  return decodedMessage;
}

console.log(decode('WECRLTEERDSOEEFEAOCAIVDEN', 3));
console.log(decode("WCLEESOFECAIVDENRDEEAOERT", 5));
