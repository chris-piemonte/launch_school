function trim(string) {
  array = string.split('').reverse();

  while (array[0] === ' ') {
    array.shift();
  }

  array.reverse();

  while (array[0] === ' ') {
    array.shift();
  }

  console.log(array.join(''));
}

trim('  abc  ');  // "abc"
trim('abc   ');   // "abc"
trim(' ab c');    // "ab c"
trim(' a b  c');  // "a b  c"
trim('      ');   // ""
trim('');         // ""
