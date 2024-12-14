function countPairs(array, target) {
  let pairs = 0;
  let left = 0;
  let right = array.length - 1;

  while (left < right) {
    if (array[left] + array[right] > target) {
      pairs += right - left;
      right -= 1;
    } else {
      left += 1;
    }
  }

  return pairs;
}

console.log(countPairs([1, 2, 3, 4, 5], 6) == 4);
// Pairs: (2, 5), (3, 4), (3, 5), (4, 5)

console.log(countPairs([1, 2, 3, 4, 5], 8) == 1);
// Pair: (4, 5)

console.log(countPairs([1, 3, 5, 7], 6) == 4);
// Pairs: (1, 7), (3, 5), (3, 7), (5, 7)

console.log(countPairs([1, 2, 3, 4], 5) == 2);
// Pairs: (2, 4), (3, 4)

console.log(countPairs([1, 2, 3, 4, 5], 10) == 0);
// No pairs
