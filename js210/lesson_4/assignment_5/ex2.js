function push(array, value) {
  array[array.length] = value;
  return array.length;
}

// function splice(array, start, number) {
//   let newArray = [];

//   for (let i = start; i < start + number; i += 1) {
//     push(newArray, array[i]);
//     array[i] = array[i + number];
//   }

//   array.length = array.length - number;
//   return newArray;
// }

function splice(array, start, count) {
  let newArray =[];
  for (let i = start; i < array.length; i += 1) {
    if (i < start + count) {
      push(newArray, array[i]);
    }

    array[i] = array[i + count];
  }

  array.length = array.length - count;
  return newArray;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]
