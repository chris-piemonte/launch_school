/*

We are assigned the task to implement a range function that returns an array of integers beginning and ending with specified start and end numbers. When only a single argument is provided, that argument should be used as the ending number and the starting number should be 0.

Check our code below. Why do the example invocations fail with an error saying Maximum call stack size exceeded? Can you fix the code, so it runs without error and satisfies the requirements?


*/

function range(start, end) {
  const range = [];

  for (let element = start; element <= end; element++) {
    range.push(element);
  }

  return range;
}

function range(end) {
  return range(0, end);
}

// Examples

console.log(range(10, 20));
console.log(range(5));

// The first `range` function on line 10 was overwritten with the range functioon on line 20. There should have been one function used with the `end` parameter as the first parameter and the `start` parameter as the 2nd parameter set to a default of 0. Or you could reassign `end` to `start` and `start` to 0 if `end` is undefined.
// function range(end, start = 0)
