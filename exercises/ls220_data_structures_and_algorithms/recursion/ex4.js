function power(num, exp) {
  if (exp === 0) return 1;

  if (exp < 0) {
    return 1 / power(num, Math.abs(exp));
  } else {
    return Math.abs(num) * power(num, exp - 1);
  }
}

console.log(power(2, 3) === 8);
console.log(power(5, 0) === 1);
console.log(power(3, 4) === 81);
console.log(power(7, 2) === 49);
console.log(power(10, 1) === 10);
console.log(power(-3, 4) === 81);
console.log(power(-7, 2) === 49);
console.log(power(3, -4) === (1/81));



// All test cases should log true.
