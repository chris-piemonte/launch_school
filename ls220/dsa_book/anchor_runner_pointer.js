// Given an array of positive integers, our task is
// to move all ones to the end of the array while preserving
// the relative order of non-one elements. The goal is to solve
// this problem in linear time complexity.

// If no ones are present in the array, no changes are needed.

// Example:
// Input: nums = [1, 2, 1, 4, 8]
// Output: [2, 4, 8, 1, 1]

// Naive approach, O(N^2)

// function moveOnes(nums) {
//   let idx = 0;
//   let counter = 0;

//   while (counter < nums.length) {
//     if (nums[idx] === 1) {
//       nums.splice(idx, 1);
//       nums.push(1);
//     } else {
//       idx++;
//     }
//     counter++;
//   }
//   return nums;
// }

// Anchor-Runner Pointer Approach, O(N)

function moveOnes(arr) {
  let anchor = 0;
  let runner = 0;

  while (runner < arr.length) {
    if (arr[runner] !== 1) {
      // Swap the elements at `anchor` and `runner`
      [arr[anchor], arr[runner]] = [arr[runner], arr[anchor]];
      // Increment `anchor` only when a swap is made
      anchor++;
    }
    // Increment `runner` every iteration
    runner++;
  }

  return arr;
}

const nums1 = [1, 2, 1, 4, 8];
const transformedNums1 = moveOnes(nums1);
console.log(nums1 === transformedNums1); // true
console.log(transformedNums1); // [2, 4, 8, 1, 1]

const nums2 = [3, 1, 5, 1, 1, 4, 8, 1];
const transformedNums2 = moveOnes(nums2);
console.log(nums2 === transformedNums2); // true
console.log(transformedNums2); // [3, 5, 4, 8, 1, 1, 1, 1]


// Anchor-Runner Reader-Writer Variant

function moveOnes(nums) {
  let writer = 0;
  let reader = 0;

  while (reader < nums.length) {
    if (nums[reader] !== 1) {
      // Overwrite the index at `writer` with the value at `reader`
      nums[writer] = nums[reader];
      // Increment `writer` when a modification is made
      writer++;
    }
    // Increment `reader` every iteration
    reader++;
  }

  while (writer < nums.length) {
    nums[writer] = 1;
    writer++;
  }

  return nums;
}

const nums1 = [1, 2, 1, 4, 8];
const transformedNums1 = moveOnes(nums1);
console.log(nums1 === transformedNums1); // true
console.log(transformedNums1); // [2, 4, 8, 1, 1]

const nums2 = [3, 1, 5, 1, 1, 4, 8, 1];
const transformedNums2 = moveOnes(nums2);
console.log(nums2 === transformedNums2); // true
console.log(transformedNums2); // [3, 5, 4, 8, 1, 1, 1, 1]
