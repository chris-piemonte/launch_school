function sumOfSums(array) {
  return sumNestedArrays(nestedArrays(array));
}

function nestedArrays(array) {
  let newArray = [];

  array.forEach((_, ind) => newArray.push(array.slice(0, ind + 1)));

  return newArray;
}

function sumNestedArrays(array) {
  return array.reduce((outerSum, arr) => {
    return outerSum + arr.reduce((innerSum, num) => innerSum + num);
  }, 0);
}


console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
