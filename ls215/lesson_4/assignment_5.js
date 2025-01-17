// Problem 1

function makeMultipleLister(num) {
  return () => {
  let number = num;
    while (number < 100) {
      console.log(number);
      number += num; 
    }
  }
}

// let lister = makeMultipleLister(13);
// lister();

// Problem 2

let sum = 0;

function add(num) {
  sum += num;
  console.log(sum);
}

function subtract(num) {
  sum -= num;
  console.log(sum);
}

// add(1);
// add(42);
// subtract(39);
// add(6);

// Problem 3

function startup() {
  let status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

let ready = startup();
let systemStatus = // ?
// There is no way to assign systemStatus to status on line 38 because there is no way to access a variable defined in the body of a function from outsied the function.
