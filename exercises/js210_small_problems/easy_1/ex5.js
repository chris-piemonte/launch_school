const readLine = require('readline-sync');

let integer = Number(readLine.question('Please enter an integer greater than 0: '));
let sumOrProduct = readLine.question('Enter "s" to compute the sum, or "p" to compute the product: ');

let answer = []
for (let i = 1; i <= integer; i += 1) {
  answer.push(i);
}

if (sumOrProduct === 's') {
  answer = answer.reduce((sum, num) => sum + num);
  sumOrProduct = 'sum';
} else {
  answer = answer.reduce((prod, num) => prod * num);
  sumOrProduct = 'product';
}

console.log(`The ${sumOrProduct} of the integers between 1 and ${integer} is ${answer}.`);
