logValue();

function logValue() {
  console.log('Hello, world!');
}

// 'Hello, world!' because function definiteitons are hoisted during the the creatioon phase of JavaScript execution
// so logValue() can still run even though it is called before the function is defined.

var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);

// 'foo' because the entire function definition is hoisted above the variable declaration so it is ommitted. Then when the code is executed line by line line 10
// reassigns logValue to 'foo', but the variable is not re-defined on line 12 because that was done during hoisting.
