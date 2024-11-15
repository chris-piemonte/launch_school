function repeatedCharacters(string) {
  string = string.toLowerCase();
  let object = {}

  for (let i = 0; i < string.length; i += 1) {
    if (Object.keys(object).includes(string[i])) {
      object[string[i]] += 1;
    } else {
      object[string[i]] = 1;
    }
  }

  for (let key in object) {
    if (object[key] === 1) delete object[key];
  }

  return object;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
