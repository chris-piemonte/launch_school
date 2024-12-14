// Given a list of numbers,
// find two numbers in the list that add up to ten
// and return them. If no such pair exists, return null.

// It is guaranteed that there is either exactly one pair of numbers
// that satisfies the condition, or no pairs at all.

/*

---PROBLEM---
input: array of numbers
output: array of 2 nunbers that add to 10, or null if no pairs

rules:
- array has exactly 1 pair or none that add to 10
- array elements all whole numbers
- array numbers positive & negative

---DATA---
- iteration through array

---ALGORITHM---
- iterate through input array
  - iterate from index 0 to second to last index
    - iterate second time from current outer index + 1 to last index
      - if elements at outer & inner indexes add to 10, return both in an array

- if no iterations add up to 10, return null
  - return null if all iteratons complete without returning

*/

function findPair(array) {
  const arrayMap = new Map();
  const target = 10;

  for (let ind = 0; ind < array.length; ind += 1) {
    const difference = target - array[ind];

    if (arrayMap.has(difference)) {
      return [difference, array[ind]];
    }

    arrayMap.set(array[ind], ind);
  }

  return null;
}

console.log(findPair([2, 3, 9, 7])); // Output: [3, 7]
console.log(findPair([10, 6, -1, 2])); // null
console.log(findPair([1, 2, 5, 6])); // null
console.log(findPair([1, 3, 6, 10, 4, 5])); // [6, 4]
console.log(findPair([4, -5, 3, 15, 5])); // [-5, 15]
