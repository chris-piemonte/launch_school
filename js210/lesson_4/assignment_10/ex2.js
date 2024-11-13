function mirroredArray(array) {
  return array.concat(array.toReversed());
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(mirroredArray(digits));  // returns [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]
