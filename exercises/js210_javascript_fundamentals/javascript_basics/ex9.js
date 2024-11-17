function integerToString(integer) {
  const CONVERSION = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let string = '';

  do {
    string += CONVERSION[integer % 10];
    integer = Math.floor(integer / 10);
  } while (integer > 0);

  return string.split('').reverse().join('');
}

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"
