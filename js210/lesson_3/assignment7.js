function isPrime(num) {
  if (num < 2 || (num > 2 && num % 2 === 0)) return false;

  for (let currentNumber = Math.floor(num / 2); currentNumber >= 2; currentNumber -= 1) {
    if (num % currentNumber === 0) return false;
  }

  return true
}

console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false
