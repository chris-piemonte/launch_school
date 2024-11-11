const readLine = require('readline-sync')

let bill = Number(readLine.question('What is the bill? \n'));
let tipPercentage = Number(readLine.question('What is the tip percentage? \n'));

let tip = Math.round(bill * (tipPercentage / 100) * 100) / 100;
let total = (bill + tip).toFixed(2);

console.log(`The tip is $${tip}`);
console.log(`The total is $${total}`);
