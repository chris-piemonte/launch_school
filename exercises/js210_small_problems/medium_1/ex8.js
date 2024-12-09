function fibonacci(n) {
  let a = 0;
  let b = 1;
  let sum = 1;

  for (let i = 3; i <= n; i += 1) {
    a = b;
    b = sum;
    sum = a + b;
  }

  return sum;
}

console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050
