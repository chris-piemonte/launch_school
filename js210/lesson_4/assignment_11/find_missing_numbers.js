function missing(array) {
  let missing = [];

  for (let num = array[0]; num < array[array.length - 1]; num += 1) {
    if (!array.includes(num)) missing.push(num);
  }

  return missing;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
