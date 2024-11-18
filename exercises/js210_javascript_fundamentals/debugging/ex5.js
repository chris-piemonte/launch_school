const readLine = require('readline-sync');

const transactionLog = [];

function processInput(input) {
  const numericalData = parseFloat(input);

  if (Number.isNaN(numericalData)) {
    throw (new Error('Data could not be converted to numerical amount.'));
  }

  return numericalData;
}

function logTransaction() {
  let data = readLine.question('Please enter the transaction amount: ');

  try {
    data = processInput(data);
    transactionLog.push(data);

    console.log('Thank you. Data accepted.');
  } catch {
    console.log(error.message);
  }
}

function transactionTotal() {
  let total = 0;

  for (let i = 0; i < transactionLog.length; i++) {
    total += transactionLog[i];
  }

  return total;
}

logTransaction();
logTransaction();
logTransaction();

console.log(transactionTotal());

// THe error variable on line 24 is not defined so it raises a ReferenceError

const readLine = require('readline-sync');

const transactionLog = [];

function processInput(input) {
  const numericalData = parseFloat(input);

  if (Number.isNaN(numericalData)) {
    throw (new Error('Data could not be converted to numerical amount.'));
  }

  return numericalData;
}

function logTransaction() {
  let data = readLine.question('Please enter the transaction amount: ');

  try {
    data = processInput(data);
    transactionLog.push(data);

    console.log('Thank you. Data accepted.');
  } catch(error) {
    console.log(error.message);
  }
}

function transactionTotal() {
  let total = 0;

  for (let i = 0; i < transactionLog.length; i++) {
    total += transactionLog[i];
  }

  return total;
}

logTransaction();
logTransaction();
logTransaction();

console.log(transactionTotal());
