// Write a function `areMatched` that takes a string as an argument
// and returns true if all types of brackets (parentheses (),
// square brackets [], and curly braces {}) in the string are
// properly matched. For the brackets to be considered
// matched, every opening bracket must have a corresponding
// closing bracket of the same type, and the brackets must be
// correctly nested.

/*

---PROBLEM---
input: string of brackers, parentheses, and curly braces [] () {}
output: true if they are properly matched, false if not

rules:
- pairs must start with a left symbol
- can have multiple left symbols in a row
- can never have more left symbols than right symbols
- one symbol cannot be inside a pair of matching symbols w/o its matching symbol

---DATA---
- array as a queue

---ALGORITHM---
- create an array of the characters of the input string called `queue`
- create counters for each of the 3 symbols `left` symbol
- pop characters out of `queue`oine at a time
  - if a left symbol, increment by 1
  - if a right symbol, decreasy be 1
- if any counter ever goes negative, return false
- if after all symbols poppped all counter = 0, return true

*/

function areMatched(string) {
  let openSymbols = []

  for (let char of string) {
    switch (char) {
      case '(':
        openSymbols.push(char);
        break;
      case ')':
        if (openSymbols[openSymbols.length - 1] === '(') {
          openSymbols.pop();
        } else {
          return false;
        }
        break;
      case '[':
        openSymbols.push(char);
        break;
      case ']':
        if (openSymbols[openSymbols.length - 1] === '[') {
          openSymbols.pop();
        } else {
          return false;
        }
        break;
      case '{':
        openSymbols.push(char);
        break;
      case '}':
        if (openSymbols[openSymbols.length - 1] === '{') {
          openSymbols.pop();
        } else {
          return false;
        }
        break;
    }
  }

  return openSymbols.length === 0;
}

console.log(areMatched("()"));              // Output: true
console.log(areMatched("([()]{})"));        // Output: true
console.log(areMatched("([((}]({}))"));     // Output: false
console.log(areMatched("{{[[(())]]}}"));    // Output: true
console.log(areMatched(""));                // Output: true
console.log(areMatched("([)]"));            // Output: false
