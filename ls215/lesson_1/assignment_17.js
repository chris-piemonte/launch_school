function octalToDecimal(numberString) {
  return numberString.split('').reverse().map(str => Number(str)).reduce((total, num, i) => total + num * Math.pow(8, i), 0);
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
