// Create a function `combinations` that takes an array of integers and an
// integer, k, and returns all possible combinations of k numbers chosen
// from the array. The input array will contain at most 20 numbers.

// Example:
// Input: nums = [1,2,3,4], k = 2
// Output: [
//   [1,2], [1,3], [1,4], [2,3], [2,4], [3,4]
// ]

function testCombinations(nums, k, expectedLength) {
  const result = combinations(nums, k);
  if (result.length !== expectedLength) return false;

  const stringifiedCombs = result.map(JSON.stringify);
  const uniqueCombs = new Set(stringifiedCombs);
  return uniqueCombs.size === expectedLength;
}



function combinations(nums, k) {
  function backtrack(nums, k, candidate, results) {
    if (candidate.length === k) {
      results.push([...candidate]);
      return;
    }

    for (let ind = 0; ind < nums.length; ind += 1) {
      candidate.push(nums[ind]);
      backtrack(nums.slice(ind + 1), k, candidate, results)
      candidate.pop();
    }
  }

  const results = [];
  const candidate = [];
  backtrack(nums, k, candidate, results);
  return results;
}

// Test Cases:
console.log(testCombinations([1,2,3,4], 2, 6)); // C(4,2) = 6
console.log(testCombinations([1,2,3,4,5], 3, 10)); // C(5,3) = 10
console.log(testCombinations([1,2,3,4,5,6], 4, 15)); // C(6,4) = 15
console.log(testCombinations([1,2,3,4,5,6,7], 3, 35)); // C(7,3) = 35
console.log(testCombinations([1,2,3,4,5,6,7,8], 5, 56)); // C(8,5) = 56
console.log(testCombinations([...Array(10).keys()].map(x => x + 1), 6, 210)); // C(10,6) = 210
console.log(testCombinations([...Array(20).keys()].map(x => x + 1), 10, 184756)); // C(20,10) = 184,756
