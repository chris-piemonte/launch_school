function wordSizes(string) {
  const object = {};

  string.split(' ').forEach(word => {
    const length = word.length;
    if (length < 1) {
      return object;
    } else if (object[length]) {
      object[length] += 1;
    } else {
      object[length] = 1;
    }
  });

  return object;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?"));                              // { "2": 1, "4": 1, "6": 1 }
console.log(wordSizes(''));                                            // {}
