function productOfSums(array1, array2) {
  let result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  let sum;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum;
}

// it will not work, it will return NaN because the total() function doesn't have an explicit return on line 13 so it willl return undefined, and on line 2 undefined * undefined returns NaN. Addityionally on line 7 sum was declared but not initialized to a value so it will have an initial value of undefined and on each for ite iterations it is reassigning sum to NaN
