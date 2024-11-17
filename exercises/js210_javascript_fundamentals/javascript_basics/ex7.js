function stringToInteger(string) {
  let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  let result = 0;

  for (let i = 0; i < string.length; i += 1) {
    result = (result * 10) + numbers[string[i]];
  }

  return result;
}

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570
console.log(stringToInteger('5070'));       // 5070
