function rot13(string) {
  const ROTATE_NUMBER = 13;

  let newString = '';

  for (let i = 0; i < string.length; i += 1) {
    let asciiNumber = string.charCodeAt(i);

    if (/[a-mA-M]/.test(string[i])) {
      asciiNumber = string.charCodeAt(i) + ROTATE_NUMBER;
    } else if (/[n-zN-Z]/.test(string[i])) {
      asciiNumber = string.charCodeAt(i) - ROTATE_NUMBER;
    }

    newString += String.fromCharCode(asciiNumber);
  }

  return newString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// logs: Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// logs: Teachers open the door, but you must enter by yourself.
