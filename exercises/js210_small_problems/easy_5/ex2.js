function doubleConsonants(string) {
  let newString = '';

  for (let i = 0; i < string.length; i += 1) {
    newString += string[i];
    if (string[i].toLowerCase().match(/[b-df-hj-np-tv-z]/)) newString += string[i];
  }

  return newString;
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""
