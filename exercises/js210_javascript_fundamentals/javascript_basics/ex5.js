const rlSync = require('readline-sync');

function math(num1, num2) {
  num1 = Number(rlSync.question('Pick a number: \n'));
  num2 = Number(rlSync.question('Pick a second number: \n'));

  console.log(`${num1} + ${num2} = ${num1 + num2}`);
  console.log(`${num1} - ${num2} = ${num1 - num2}`);
  console.log(`${num1} * ${num2} = ${num1 * num2}`);
  console.log(`${num1} / ${num2} = ${num1 / num2}`);
  console.log(`${num1} % ${num2} = ${num1 % num2}`);
  console.log(`${num1} ** ${num2} = ${num1 ** num2}`);
}

math();
