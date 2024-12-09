/*
The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

Counting from the rightmost digit and moving left, double the value of every second digit
For any digit that thus become 10 or more, subtract 9 from the result
  - 1111 becomes 2121
  - 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)

Add all these digits together
  - 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
  - 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20

If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

--PROBLEM---
input: string of digits
output: boolean true of false based on if it follows Luhn formula
  - must end in 0

rules:
  - input will be string of digits
  - output will be true/false
    - true if final string/number ends in 0
  - apply Luhn formula to input string
    - starting from right, double every other digit
    - if digit becomes >= 10, subtract 9
    - sum all digits to form the `checksum`
    - if checksum ends in 0, return true. If not, return false
  - ignore all non-numeric characters in input string
    - don't count them in every other digit rule

Questions:
  - Will input always be a string?
  - Can input be empty string?
  - What if more than 1 argument?
  - Will string always have same amopunt of digits?
  - What if too few or too many digits?
  - what if no arguments?
  - should numbers only be taken 0 - 9? i.e. is 15 1 & 5 or 15?
  - is checksum of just 0 valid?
  - what if first argument isn't string, second argument is?

---DATA---
  - array of characters of string
    - remove any non-digits
    - transform every other number from right using formula
    - reduce to compute checksum

---ALGORITHM---
1. Return false if input isn't a string
  - check the type of input, ensure it's string
  - if input missing, return false
2. Remove all non-digits from string
  - replace any characters in the string that aren't digits w/ empty strings using regex
3. Create array of characters of string
4. Transform every other character from the right
  - calculate the length of the string
    - 1, 2, 3, 4, 5
      - if odd, transform every odd integer
    - 1, 2, 3, 4
      - if even, transform every even integer
    - every integer that you are transforming, convert it to a number, multiply it by 2
      - check the new number, if 10 or greater subtract 9
5. Sum digits & Validate
  - chain a method to reduce the elements of the array
  - sum them & return accumulator
6. Check how accumulator ends
  - convert accumulator into String
  - slice the string by the last index
  - if the element converted back to number is 0 return true, else return false

*/

function luhnFormula(string) {
  if (typeof string != 'string') return false;

  let characters = string.replace(/\D/g, '').split('');
  if (characters.length === 0) return false;

  let length = characters.length;
  let transformedNums = characters.map((num, ind) => {
    num = Number(num);
    if (length % 2 === 1) {
      if (ind % 2 === 1) {
        num = num * 2;
        if (num >= 10) num -= 9;
        return num;
      } else {
        return num;
      }
    } else if (ind % 2 === 0) {
      num = num * 2;
      if (num >= 10) num -= 9;
      return num;
    } else {
      return num;
    }
  });

  let checkSum = transformedNums.reduce((sum, num) => sum + num);
  if (Number(String(checkSum)[String(checkSum).length - 1]) === 0) {
    return true;
  } else {
    return false;
  }
}

// True
console.log(luhnFormula('8763') === true);
console.log(luhnFormula('00000000') === true);
console.log(luhnFormula('8367', 1234) === true);
console.log(luhnFormula('2323 2005 7766 3554') === true);
console.log(luhnFormula('2323 2500 7667 3455') === true);
console.log(luhnFormula('2323* 2500 $766%7 34^55') === true);
console.log(luhnFormula('1222') === true);


// False
console.log(luhnFormula('1221') === false);
console.log(luhnFormula('sgrsgae') === false);
console.log(luhnFormula('') === false);
console.log(luhnFormula() === false);
console.log(luhnFormula(['a', 'b']) === false);
console.log(luhnFormula(['8', '7', '6', '3']) === false);
console.log(luhnFormula(8763) === false);

