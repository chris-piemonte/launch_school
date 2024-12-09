/*

Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.

---PROOBLEM---
- input: string
- outpput: new string, w/ nums and letters swapped

rules:
  - input will always be a string
  - will always be an argument
  - only 1 argument
  - can have any character in string
    - any non-alphanumeric characters should stay in place
  - could be an empty string argument
  - can have spaces
  - always return new string

---DATA---
- array of input string characters
- arrays to hold letters & numbers to be swapped
- new string or array to construct result

---ALGORITHM---
  - Split string into `chars` array of characters
    - split string using '' as delimeter
  - create 2 arrays containing all letters & nums to be swapped
      - use regex, replace any non letter chars in input w/ ''
        - split resulting string into array of chars, set to `letters`
      - use regex, replace any non numbers chars in input w/ ''
        - split resulting string into array of chars, set to `numbers`
    - create variable `numberOfSwaps` set to lower number of letters or numbers
      - find lower arraylength, set to `numberOfSwaps`
      - reassign both arrays to themselves from ind 0 to `numberOfSwaps` using splice
  - Iterate through `chars`, add appropriate character to new `result` string
    -create new `result` string`
    - iterate through `chars` w/ forEach
      - concatenate `result` w/ return value of `nextChar(currentEle, letters, numbers`
  - Return `result` string

  HELPER: nextChar(currentEle, letters, numbers)
    - check if currentEle is letter
      - if so, check if numbers lenght > 0
        - if so, return numbers fist element mutated using shift
      - if not, return currentEle
    - check if currentEle is number
      - if so, check if letters lenght > 0
        - if so, return letters fist element mutated
      - if not, return currentEle
    - else
      - return curentEle
*/

function swap(str) {
  let chars = [...str];
  let letters = str.match(/[a-zA-Z]/g);
  let numbers = str.match(/[\d]/g);
  if (letters === null || numbers === null) return str;

  let numberOfSwaps = letters.length;
  if (numbers.length < letters.length) numberOfSwaps = numbers.length;
  letters.splice(numberOfSwaps);
  numbers.splice(numberOfSwaps);


  let result = ''
  chars.forEach(ele => {
    result += nextChar(ele, letters, numbers);
  });

  return result;
}

function nextChar(currentEle, letters, numbers) {
  if (/[a-zA-Z]/.test(currentEle)) {
    if (numbers.length > 0) return numbers.shift();
    return currentEle;
  } else if (/[\d]/.test(currentEle)) {
    if (letters.length > 0) return letters.shift();
    return currentEle;
  }

  return currentEle;
}

console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true
console.log(swap("") === ""); // true
console.log(swap("a$b^cd123") === "1$2^3dabc"); // true
console.log(swap("1a2b345c") === "a1b2c453"); // true
console.log(swap("abcde") === "abcde"); // true
console.log(swap("5678") === "5678"); // true
console.log(swap("!@#$") === "!@#$"); // true
