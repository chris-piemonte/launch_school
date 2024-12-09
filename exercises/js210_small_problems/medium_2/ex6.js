function sumSquareDifference(num) {
  const numbers = []
  for (let i = 1; i <= num; i += 1) {
    numbers.push(i);
  }

  const squareSum = numbers.reduce((accum, num) => accum += num, 0);
  const sumSquare = numbers.reduce((accum, num) => accum += Math.pow(num, 2), 0);

  return Math.pow(squareSum, 2) - sumSquare;
}

console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150
