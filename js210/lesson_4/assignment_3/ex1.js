function push(array, value) {
  array[array.length] = value;
  return array.length;
}

let count = [0, 1, 2];
console.log(push(count, 3));         // 4
console.log(count);                  // [ 0, 1, 2, 3 ]
