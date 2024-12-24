// Create a function `calculator` that evaluates arithmetic
// expressions given as strings. The function should support
// basic arithmetic operations: addition (+), subtraction (-),
// multiplication (*), and division (/).

// The function should:
// 1. Accept a string input representing a valid arithmetic expression.
//    The input will consist of non-negative integers, arithmetic
//    operator(+, -, *, /), and may contain whitespace characters.
// 2. Evaluate the expression following the standard order of operations
//    (multiplication and division before addition and subtraction).
// 3. Return the result as an integer.

// For division operations, the result should be rounded down to
// the nearest integer (floor division).

// You can assume that the input will never contain division by zero.

// Note: Implement the calculation logic yourself without using
// any built-in expression evaluation functions.

// Examples:
//
// 1. Input: "4 + 3 * 2"
//    Output: 10
//    Explanation: 3*2 is evaluated first (6), then added to 4.
//
// 2. Input: "15 / 3 - 2"
//    Output: 3
//    Explanation: 15/3 is 5, then 2 is subtracted.
//
// 3. Input: "10 + 8 / 3"
//    Output: 12
//    Explanation: 8/3 is 2 (rounded down), then added to 10.

/*

---PROBLEM---
input: string representing an arithmetic expression
output: result of the arithmetic expression

rules:
- needs to support addition, subtraction, multiplication, and division
- can contain white space
- order of operations matters
- all numbrs in strings will be positive integers
- divison operations should be rounded down to nearest whole integer
- will not be asked to divide by 0

---DATA---
- array stack to store numbers and operations

---ALGORITHM---
- create all the variables and containers needed
  - an empty array `stack`
  - an empty string variable `operator`
  - an empty string variable `currrentNum`

- create a loop from the first to last character of the string
  - if the current character is a digit, concatenate it t `currentNum`
  - if the current character isn't a digit or whitespace store it in `operator`
  - if the character is a whitespace ignore it

  - if the operator is not anempty string and a new non-digit/whitespace character is iterated over, enter a conditional statement
    - if `operator` is (converting `currentNum` to a number each time:
      - a +, push `currentNum` to the stack
      - a -, push `currentNum` * -1 to the stack
      - a *, pop the last element in stack, multiply it by `currentNum`, push to stack
      - a /, pop the last element in stack, divide by `currentNum`, round down to whole integer, push to stack

- sum the stack and return
*/

function calculator(expression) {
  let stack = [];
  let operator = ''
  let currentNum = ''

  for (let i = 0; i <= expression.length; i += 1) {
    const char = expression[i];
    if (char === ' ') {
      continue;
    } else if (/\d/.test(char)) {
      currentNum += char;
    } else {
      switch (operator) {
        case '':
          stack.push(Number(currentNum));
          break;
        case '+':
          stack.push(Number(currentNum));
          break;
        case '-':
          stack.push(Number(currentNum) * -1);
          break;
        case '*':
          stack.push(Number(currentNum) * stack.pop());
          break;
        case '/':
          let num = stack.pop() / Number(currentNum);
          stack.push(Math.floor(num));
          break;
      }
      operator = char;
      currentNum = '';
    }
  }

  return stack.reduce((sum, num) => sum + num);
}

console.log(calculator("6 - 2") === 4);
console.log(calculator(" 8 / 3") === 2);
console.log(calculator("2+3*4") === 14);
console.log(calculator("10 - 2 * 3 + 4 ") === 8);
console.log(calculator(" 20 / 4 * 2 + 7") === 17);
console.log(calculator("5 + 3 * 2 - 8 / 4") === 9);
console.log(calculator("10+5/4-3*2+2") === 7);
console.log(calculator(" 30 / 3 * 2 - 4 * 2 / 4 + 1 ") === 19);
console.log(calculator("100 - 20 * 3 / 2 + 5 * 4 - 10 / 2 * 3") === 75);
// All test cases should log true.
