function isPrime(num) {
  if (num < 2 || (num > 2 && num % 2 === 0)) return false;

  for (let currentNumber = Math.floor(num / 2); currentNumber >= 2; currentNumber -= 1) {
    if (num % currentNumber === 0) return false;
  }

  return true
}

function checkGoldbach(num) {
  if (num < 4 || num % 2 !== 0) return console.log(null);

  for (let currentNumber = 2; currentNumber <= num / 2; currentNumber += 1) {
    if (isPrime(currentNumber) && isPrime(num - currentNumber)) {
      console.log(`${currentNumber} ${num - currentNumber}`);
    }
  }
}

checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
