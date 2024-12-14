// function findAverages(array, k) {
//   const subArrays = findSubArrays(array, k);
  
//   return subArrays.map(sub => {
//     return sub.reduce((sum, num) => sum + num) / sub.length;
//   });
// }

// function findSubArrays(array, k) {
//   subArrays = []
//   let startInd = 0;
//   let endInd = k;

//   while (endInd <= array.length) {
//     subArrays.push(array.slice(startInd, endInd));
//     startInd += 1;
//     endInd += 1;
//   }

//   return subArrays;
// }

function findAverages(array, k) {
  let result = [];
  let left = 0;
  let sum = 0;

  for (let right = 0; right < array.length; right += 1) {
    sum += right

    if (right > k - 1) {
      sum -= left;
      result.push(sum / k);
      left += 1;
    }
  }

  return result;
}

console.log(findAverages([1, 2, 3, 4, 5, 6], 3)); // [ 2, 3, 4, 5 ]
console.log(findAverages([1, 2, 3, 4, 5], 2));    // [1.5, 2.5, 3.5, 4.5]
console.log(findAverages([10, 20, 30, 40, 50], 4)); // [ 25, 35 ]
console.log(findAverages([5, 5, 5, 5, 5], 1));      // [ 5, 5, 5, 5, 5 ]
console.log(findAverages([1, 3, 2, 6, -1, 4, 1, 8, 2], 5)); // [2.2, 2.8, 2.4, 3.6, 2.8]
