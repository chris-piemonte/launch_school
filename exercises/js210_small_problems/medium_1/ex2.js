/*

---PROBLEM---
input: number, integer n
output: number with last n digits rotated one digit to the left, moving first digit to the end

rules:
  - input a whole number
  - n a whole number
  - n <= total number of digits of number
  - rotate the last n digits one to the left
  - return value is a number

--DATA---
- array, iteration

---ALGORITHM---
- turn input numbr into an array of character
  - convert input numbr into a string
  - turn the string into an array of the characters
- iterate from length of array - n, n - 1 times
  - create a for loop from array's length - n, n - 1 times
- swap the current index with the current index plus 1
  - use [a, b] = [b - a] to mutate array while iterating through it
- rejoin the array into a number
  - join array back to string with empty string as delimieter
  - convert string to number & return

*/

function rotateRightmostDigits(number, n) {
  let array = String(number).split('');

  for (let i = array.length - n; i < array.length - 1; i += 1) {
    [array[i], array[i + 1]] = [array[i + 1], array[i]];
  }

  return Number(array.join(''));
}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917

