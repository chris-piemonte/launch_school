function shift(array) {
  let result = array[0];
  if (result === undefined) return result;

  for (let i = 0; i < array.length - 1; i += 1) {
    array[i] = array[i + 1];
  }

  array.length = array.length - 1;
  return result;
}

function shift(array) {
  let result;

  if (array.length > 0) {
    result = array.splice(0,1).pop();
  }

  return result;
}

function unshift(array, ...args) {
  let numNewEle = args.length;

  for (let i = array.length + numNewEle -1; i >= numNewEle; i -= 1) {
    array[i] = array[i - numNewEle];
  }

  for (let i = 0; i < numNewEle; i += 1) {
    array[i] = args[i];
  }

  return array.length;
}

function unshift(array, ...args) {
  for (let i = 0; i < args.length; i += 1) {
    array.splice(i, 0, args[i]);
  }

  return array.length;
}

console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]
