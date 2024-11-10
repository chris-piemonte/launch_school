function startsWith(string, searchString) {
  for (let i = 0; i < searchString.length; i += 1) {
    if (string[i] !== searchString[i]) return console.log(false);
  }

  return console.log(true);
}

let str = 'We put comprehension and mastery above all else';
startsWith(str, 'We');              // true
startsWith(str, 'We put');          // true
startsWith(str, '');                // true
startsWith(str, 'put');             // false

let longerString = 'We put comprehension and mastery above all else!';
startsWith(str, longerString);      // false`
