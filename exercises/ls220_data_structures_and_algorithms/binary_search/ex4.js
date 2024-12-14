function isSquareInteger(num) {
  let left = 1, right = num;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (mid * mid === num) {
      return true;
    } else if (mid * mid < num) {
      left += 1;
    } else {
      right -= 1;
    }
  }

  return false;
}

console.log(isSquareInteger(1) === true);
console.log(isSquareInteger(4) === true);
console.log(isSquareInteger(16) === true);
console.log(isSquareInteger(14) === false);
console.log(isSquareInteger(25) === true);
console.log(isSquareInteger(26) === false);

// All test cases should log true.
