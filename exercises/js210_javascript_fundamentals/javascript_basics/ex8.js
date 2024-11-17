function stringToSignedInteger(string) {
  let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  let result = 0;

  for (let i = 0; i < string.length; i += 1) {
    if (/[+-]/.test(string[i])) continue;
    result = (result * 10) + numbers[string[i]];
  }

  if (string[0] === '-') return -result;
  return result;
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100
