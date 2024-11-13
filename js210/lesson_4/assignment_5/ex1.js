function push(array, value) {
  array[array.length] = value;
  return array.length;
}

function slice(array, start, end) {
  let newArray = []

  for (let i = start; i < end; i += 1) {
    push(newArray, array[i]);
  }

  return newArray;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]
