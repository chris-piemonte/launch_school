function repeat(string, times) {
  if (/\D/.test(times)) return console.log(undefined);

  let newString = ''
  for (times; times > 0; times -= 1) {
    newString += string
  }
  console.log(newString);
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined
