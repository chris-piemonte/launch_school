function push(array, value) {
  array[array.length] = value;
  return array.length;
}

function concat(array1, array2) {
  let newArray = [];

  array1.forEach((ele) => push(newArray, ele));
  array2.forEach((ele) => push(newArray, ele));

  return newArray;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
