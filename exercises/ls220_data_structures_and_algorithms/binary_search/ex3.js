function isTargetFrequent(nums, target) {
  return rightIndex(nums, target) - leftIndex(nums, target) + 1 > 3;
}

function rightIndex(nums, target) {
  let left = 0, right = nums.length - 1;
  let index;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (nums[mid] <= target) {
      if (nums[mid] === target) {
        index = mid;
      }
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return index === undefined ? -1 : index;
}

function leftIndex(nums, target) {
  let left = 0, right = nums.length - 1;
  let index;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (nums[mid] < target) {
      left = mid + 1;
    } else {
      if (nums[mid] === target) {
        index = mid;
      }
      right = mid - 1;
    }
  }

  return index === undefined ? -1 : index;
}

console.log(isTargetFrequent([1, 2, 3, 3, 3, 3, 4], 3) === true);
console.log(isTargetFrequent([1, 1, 1, 1, 2, 3, 4], 1) === true);
console.log(isTargetFrequent([1, 2, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([1, 1, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([2, 2, 2, 3, 3, 3, 4], 3) === false);
console.log(isTargetFrequent([4, 4, 4, 4, 4, 4, 4], 4) === true);

// All test cases should log true.
