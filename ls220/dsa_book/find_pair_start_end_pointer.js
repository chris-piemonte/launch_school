// Given a sorted array in ascending order, our task is to find two numbers
// in the array that sum up to a target number, and return them.

// If you don't find a pair that adds up to the target, return null.

// The order of the output array matters, and the number that appears first
// should be the first one in the output array.

// The problem guarantees that there will be either one
// unique pair that matches the target sum or no pairs at all.

// Test Cases:

function findPair(array, target) {
  let start = 0;
  let end = array.length - 1;

  while (start < end) {
    const currentSum = array[start] + array[end];
    if (currentSum === target) {
      return [array[start], array[end]];
    } else if (currentSum < target) {
      start++;
    } else {
      end--;
    }
  }
  return null;
}

// Test cases
const nums1 = [1, 3, 6, 7, 8, 12];
const target1 = 14;
console.log(findPair(nums1, target1)); // Output: [6, 8]

const nums2 = [2, 6, 8, 10];
const target2 = 17;
console.log(findPair(nums2, target2)); // null
