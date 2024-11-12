function stringy(num) {
  let string = ''
  let one = true;

  for (; num > 0; num -= 1) {
    string += (one ? 1 : 0);
    one = !one
  }

  return console.log(string);
}

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"
