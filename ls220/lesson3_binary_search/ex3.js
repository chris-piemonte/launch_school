// Write a function named `minLengthForTargetSum` that
// determines the minimal length of a contiguous subarray
// within an array of positive integers, `nums`. This
// subarray should have a sum that is greater than or
// equal to a specified positive integer, `target`.
// The function should return the length of this
// subarray. If no such subarray exists, return 0.

// The time complexity of your solution should be O(NlogN).

// Example:
// Input: nums = [4, 2, 5, 7], target = 10
// Output: 2
// Explanation: In this example, the shortest subarray that
//              meets or exceeds the target sum of 10 is [5, 7].
//              This subarray sums to 12, which is greater than
//              the target sum of 10. The length of this subarray is 2.

/*

---PROBLEM---
input: array of positive integers, positive target integer
output: length of shortest sub-array >= 2nd target argument integer

rules:
- sub-arrays must be contiguous
- must use binary search- return 0 if no sub-arrays are >= target
  - if entire array doesn't sum to >= target

---DATA---
-binary search, 2 pointers

---ALGOTIRHM---
- if entire array doens't sum to >= target return 0

- create 2 pointers for the start and end of the array called `left` & `right`

- start a while loop while left <= right
  - find the midpoint b/w left & right
  - check if the sub-array from left to right >= target
    - if so check if the sub-array from left to midpoint >= target
      - if so move right to midpoint - 1
    - if not check if the sub-array from midpoint to right >= target
      - if so move left to midpoint + 1
  - if not increment left by 1

- return right - left + 1

HELPER: sumMeetsTarget(subarray)
- reduce the input array
- return if it is >= target

*/


function minLengthForTargetSum(nums, target) {
  function sumMeetsTarget(subarray) {
    return subarray.reduce((sum, num) => sum + num) >= target;
  }

  if (!sumMeetsTarget(nums)) return 0;

  left = 1;
  right = nums.length;
  length = nums.length;

  while (left <= right) {
    middle = Math.floor((left + right) / 2)
    let subLeft = 0;
    let subRight = middle - 1;
    let foundSubArray = false

    while (subRight < nums.length) {
      if (sumMeetsTarget(nums.slice(subLeft, subRight + 1))) {
        foundSubArray = true;
        length = middle;
        break;
      }
      subLeft += 1;
      subRight += 1;
    }

    if (foundSubArray) {
      right = middle - 1;
    } else {
      left = middle + 1
    }
  }

  return length;
}

console.log(minLengthForTargetSum([1, 2, 3], 5) === 2);
console.log(minLengthForTargetSum([1, 1, 1], 4) === 0);
console.log(minLengthForTargetSum([8, 2, 1, 4], 8) === 1);
console.log(minLengthForTargetSum([1, 2, 5, 4, 3], 9) === 2);
console.log(minLengthForTargetSum([1, 4, 1, 3, 6, 2], 9) === 2);
console.log(minLengthForTargetSum([1, 2, 3, 4], 10) === 4);
console.log(minLengthForTargetSum([1, 2, 6, 1, 1, 7], 9) === 3);
console.log(minLengthForTargetSum([4, 2, 2, 1, 5, 2], 14) === 5);

// All test cases should log true
