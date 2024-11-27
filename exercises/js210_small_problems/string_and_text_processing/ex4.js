function wordCap(string) {
  return string.split(/\s/).map(word => word.split('').map((char, ind) => {
    if (ind === 0) return char.toUpperCase();
    return char.toLowerCase();
  }).join('')).join(' ');
}

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'
