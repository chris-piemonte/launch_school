function twoSumLessThanTarget(array, target) {
  array = array.sort((a, b) => a - b);
  let result = -1
  let left = 0;
  let right = array.length - 1;

  while (left < right) {
    let sum = array[left] + array[right];
    if (sum < target) {
      result = Math.max(result, sum);
      left += 1;
    } else {
      right -= 1;
    }
  }

  return result;
}

console.log(twoSumLessThanTarget([3, 1, 4], 5) === 4);
console.log(twoSumLessThanTarget([8, 2, 4, 9, 5, 10, 1, 7], 16) === 15);
console.log(twoSumLessThanTarget([5, 8, 3, 2, 1], 6) === 5);
console.log(twoSumLessThanTarget([6, 8, 10, 12], 5) === -1);
console.log(twoSumLessThanTarget([1, 2, 3, 4, 5], 100) === 9);
console.log(twoSumLessThanTarget([10, 20, 30, 40, 50], 40) === 30);
console.log(twoSumLessThanTarget([7, 4, 15, 11, 21, 9], 24) === 22);
// All test cases should log true
