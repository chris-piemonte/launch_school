const fibonacciTable = {}


function fibonacciMemoization(n) {
  if (n <= 2) return 1;
  if (fibonacciTable[n]) return fibonacciTable[n];

  fibonacciTable[n] = fibonacciMemoization(n - 1) + fibonacciMemoization(n - 2);
  return fibonacciTable[n];
}

console.log(fibonacciMemoization(1));       // 1
console.log(fibonacciMemoization(2));       // 1
console.log(fibonacciMemoization(3));       // 2
console.log(fibonacciMemoization(4));       // 3
console.log(fibonacciMemoization(5));       // 5
console.log(fibonacciMemoization(12));      // 144
console.log(fibonacciMemoization(20));      // 6765
