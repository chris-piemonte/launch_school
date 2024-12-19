// Write a function named `minLengthForTargetSum` that
// determines the minimal length of a contiguous subarray
// within an array of positive integers, `nums`. This
// subarray should have a sum that is greater than or
// equal to a specified positive integer, `target`. The
// function should return the length of this subarray.
// If no such subarray exists, return 0.

// Example:
// Input: nums = [4, 2, 5, 7], target = 10
// Output: 2
// Explanation: In this example, the shortest subarray that
//              meets or exceeds the target sum of 10 is [5, 7].
//              This subarray sums to 12, which is greater than
//              the target sum of 10. The length of this
//              subarray is 2.

/*

--PROBLEM---
input: array of positive integers, target number
output: length of longest sub-array whose integers are contiguous and sum is >= target number

rules:
- all integers positive
- all array inputs are not empty
- target could be 0
- sum of integers in sub-array must be >= target
- arrays all bigger than 1

---ALGORITHM---
- set a maximum length counter to 0 to keep track of longest sub-array

- set an anchor the start of the array and a runner to the 2nd element

- iterate through the array to get sub-arrays
  - until runner reaches the end of the array
    - if runner <= previous integer in array, reassign anchor to runner and increase runner index by 1
    - if runner > previous integer in array
      - if the sum of the elements in the sub-array from anchor to runner >= target
        - if sub-array length > max length tracker, reassign max-length tracker
        - increment runner by 1

- return maximum length counter

*/


function minLengthForTargetSum(nums, target) {
  let minLength = Infinity;
  let anchor = 0, runner = 0;

  while (runner < nums.length && anchor < nums.length) {
    const subArraySum = nums.slice(anchor, runner + 1).reduce((sum, num) => sum + num)
    const subArrayLength = nums.slice(anchor, runner + 1).length;
    if (subArraySum >= target) {
      if (minLength > subArrayLength) {
        minLength = subArrayLength;
      }
      anchor += 1;
      if (anchor <= runner) continue;
    }

    runner += 1;
  }

  return minLength < Infinity ? minLength : 0;
}

console.log(minLengthForTargetSum([1, 2, 3], 5) === 2);
console.log(minLengthForTargetSum([1, 1, 1], 4) === 0);
console.log(minLengthForTargetSum([8, 2, 1, 4], 8) === 1);
console.log(minLengthForTargetSum([1, 2, 3, 4, 5], 9) === 2);
console.log(minLengthForTargetSum([1, 4, 1, 3, 6, 2], 9) === 2);
console.log(minLengthForTargetSum([1, 2, 3, 4], 10) === 4);
console.log(minLengthForTargetSum([1, 2, 6, 1, 1, 7], 9) === 3);
console.log(minLengthForTargetSum([4, 2, 2, 1, 5, 2], 14) === 5);

// All test cases should log true
