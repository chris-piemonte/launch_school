// function gcd(num1, num2) {
//   for (let max = [num1, num2].sort()[0]; ; max -= 1) {
//     if (num1 % max === 0 && num2 % max === 0) return console.log(max);
//   }
// }

// gcd(12, 4);   // 4
// gcd(15, 10);  // 5
// gcd(9, 2);    // 1

function gcd(array) {
  function gdcTwoNumbers(num1, num2) {
    for (let max = [num1, num2].sort()[0]; ; max -= 1) {
      if (num1 % max === 0 && num2 % max === 0) return console.log(max);
    }
  }
  
  array.reduce((divisor, num) => gdcTwoNumbers(divisor, num));
}

gcd([5, 10, 15, 20]);
