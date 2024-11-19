function sequence(int) {
  let array = [];

  for (let num = 1; num <= int; num += 1) {
    array.push(num);
  }

  return array;
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
