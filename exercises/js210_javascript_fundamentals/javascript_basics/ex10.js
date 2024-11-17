function integerToString(integer) {
  const CONVERSION = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let string = '';

  do {
    string += CONVERSION[integer % 10];
    integer = Math.floor(integer / 10);
  } while (integer > 0);

  return string.split('').reverse().join('');
}

function signedIntegerToString(integer) {
  if (integer < 0) {
    return '-' + integerToString(Math.abs(integer));
  } else if (integer > 0) {
    return '+' + integerToString(integer);
  } else if (Object.is(integer, -0)) {
    return '-' + integerToString(integer);
  }  else {
    return integerToString(integer);
  }
}

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"
console.log(signedIntegerToString(-0));
console.log(signedIntegerToString(-0) === "-0");
