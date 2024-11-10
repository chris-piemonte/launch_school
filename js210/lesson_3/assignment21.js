function rot13(string) {
  const rotateNumber = 13;
  let newString = '';

  for (let i = 0; i < string.length; i += 1) {
    if (/[A-Z]/.test(string[i])) {
      let asciiNumber = string.charCodeAt(i) + rotateNumber;
      if (asciiNumber > 90) asciiNumber -= (rotateNumber * 2);
      newString += String.fromCharCode(asciiNumber);
    } else if (/[a-z]/.test(string[i])) {
      let asciiNumber = string.charCodeAt(i) + rotateNumber;
      if (asciiNumber > 122) asciiNumber -= (rotateNumber * 2);
      newString += String.fromCharCode(asciiNumber);
    } else {
      newString += string[i];
    }
  }

  return newString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// logs: Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// logs: Teachers open the door, but you must enter by yourself.
