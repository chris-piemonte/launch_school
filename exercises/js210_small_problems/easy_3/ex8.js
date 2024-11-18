function swap(string) {
  let array = string.split(' ');
  return array.map(word => {
    let length = word.length;
    if (length === 1) return word;
    return word[length - 1] + word.slice(1, -1) + word[0];
  }).join(' ');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"
