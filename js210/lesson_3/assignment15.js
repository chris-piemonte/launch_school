function splitString(string, delimiter) {
  if (delimiter === undefined) return console.log('ERROR: No delimeter');
  // if (delimiter === '') {
  //   for (let i = 0; i < string.length; i += 1) {
  //       console.log(string[i]);
  //   }
  //   return;
  // }

  let currentString = ''
  for (let i = 0; i < string.length; i += 1) {
    if (delimiter === '') {
      console.log(string[i]); 
    } else if (string[i] !== delimiter) {
      currentString += string[i];
    } else {
      console.log(currentString);
      currentString = ''
    }
  }

  if (currentString) console.log(currentString);
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// // logs:
// // ERROR: No delimiter

splitString('hello', '');
// // logs:
// // h
// // e
// // l
// // l
// // o

splitString('hello', ';');
// // logs:
// // hello

splitString(';hello;', ';');
// // logs:
// //  (this is a blank line)
// // hello
