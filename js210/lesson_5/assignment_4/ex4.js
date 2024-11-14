function wordCount(string) {
  let object = {};

  string.split(' ').forEach(word => {
    if (object[word]) {
      object[word] += 1;
    } else {
      object[word] = 1;
    }
  });

  return object;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }
