function matrixSums(arr) {
  return arr.map(subArray => subArray.reduce(function(sum, num) {
    return sum + num
  }));
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]
