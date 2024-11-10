function multiplesOfThreeAndFive() {
  for (let num = 1; num <= 100; num += 1) {
    if (num % 3 === 0 && num % 5 === 0) {
      console.log(num.toString() + '!');
    } else if (num % 3 === 0 || num % 5 === 0) {
      console.log(num.toString());
    }
  }
}

function multiplesOfThreeAndFive(num1, num2) {
  for (; num1 <= num2; num1 += 1) {
    if (num1 % 3 === 0 && num1 % 5 === 0) {
      console.log(num1.toString() + '!');
    } else if (num1 % 3 === 0 || num1 % 5 === 0) {
      console.log(num1.toString());
    }
  }
}

multiplesOfThreeAndFive(5, 70);
