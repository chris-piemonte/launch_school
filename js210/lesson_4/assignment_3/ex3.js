function unshift(array, value) {
  for (let i = array.length - 1; i >= 0; i -= 1) {
    array[i + 1] = array[i];
  }

  array[0] = value;
  return array.length;
}

let count = [1, 2, 3];
console.log(unshift(count, 0));      // 4
console.log(count);                  // [ 0, 1, 2, 3 ]
