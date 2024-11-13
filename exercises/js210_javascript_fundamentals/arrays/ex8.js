function slice(array, begin, end) {
  if (begin > array.length - 1) begin = array.length;
  if (end > array.length - 1) end = array.length;
  let newArray = [];

  for (let i = begin; i < end; i += 1) {
    newArray.push(array[i]);
  }

  return newArray;
}

console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));                     // [2, 3]
console.log(arr1);                                  // [1, 2, 3]



function splice(array, start, deleteCount, ...args) {
  if (start >= array.length - 1) start = array.length - 1;
  if (start + deleteCount > array.length) deleteCount = array.length - start;
  
  let newArray = [];
  for (i = start; i < start + deleteCount; i += 1) {
    newArray.push(array[i]);
    array[i] = array[i + deleteCount];
  }
  array.length = array.length - deleteCount;

  array.length = array.length + args.length
  for (i = array.length - 1; i >= start + args.length; i -= 1) {
    array[i] = array[i - args.length];
  }

  for (i = start; args.length > 0; i += 1) {
    array[i] = args.shift();
  }

  return newArray
}

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a'));               // []
console.log(arr5);                                  // ["a", 1, 2, 3]
