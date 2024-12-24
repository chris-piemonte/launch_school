// Write a function `findPeakInTerrain` that finds any peak in a
// given hilly terrain. A peak is an element that is strictly
// greater than its neighbors. The first and last elements can
// be peaks if they are strictly greater than their single neighbor.
// Adjacent elements in the terrain cannot be equal.

// The function should take an array of integers as input,
// representing the elevations of spots in the terrain.
// It should return the index of any peak in the terrain.
// There is guaranteed to be at least one peak in the input array.

// Example:
// Input: terrain = [1, 3, 2, 1, 4, 5]
// Output: 1 or 5
// Explanation: Both index 1 (elevation 3) and index 5
//              (elevation 5) are peaks.

/*

--PROBLEM---
input: array of integers
output: index of any element where both neighbor elemns are smaller (peak)

rules:
- every argument will have at least 1 peak
- peaks cannnot have neighbor elements same size
- all elements increase or decrease in increments of 1
- if largest integer is a peak it is the answer

---DATA---
- binary search

---ALGORITHM---
- create all variable trackers
  - left & right pointers to start & end of array for binary search

- use binary search to find middle element of current array
  - After moving Left or Right to middle index:
    - if element to the left & right are both smaller, return index
    - if element to the left and right are both larger, move opposite pointer to middle element +/- 1
    - if only 1 element to the left or right is larger, move current pointer to middle index +/- 1

*/

function findPeakInTerrain(terrain) {
  if (terrain[1] < terrain[0]) return 0;
  if (terrain[terrain.length - 2] < terrain[terrain.length - 1]) {
    return terrain.length - 1;
  }

  let left = 0;
  let right = terrain.length - 1;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    let l = mid - 1, r = mid + 1;

    // if (l === -1) {
    //   if (terrain[1] < terrain[0]) return 0;
    // } else if (r === terrain.length) {
    //   if (terrain[terrain.length - 2] < terrain[terrain.length - 1]) return terrain.length - 1;
    // }

    if (terrain[l] < terrain[mid] && terrain[r] < terrain[mid]) {
      return mid;
    } else if (terrain[l] > terrain[mid] && terrain[r] < terrain[mid]) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
}

console.log(findPeakInTerrain([1, 2, 1]) === 1);
console.log(findPeakInTerrain([1, 3, 4, 1]) === 2);
console.log(findPeakInTerrain([3, 2, 1]) === 0);
console.log(findPeakInTerrain([1, 2, 3]) === 2);
console.log([1, 4].includes(findPeakInTerrain([1, 3, 2, 1, 5, 4])));
console.log(findPeakInTerrain([1, 2, 3, 4, 5, 7, 3]) === 5);
console.log(findPeakInTerrain([1, 2, 3, 4, 3, 2, 1]) === 3);
console.log([0, 8].includes(findPeakInTerrain([5, 4, 3, 2, 1, 2, 3, 4, 5])));
console.log(findPeakInTerrain([1, 2, 3, 4, 5, 4, 3, 2, 1]) === 4);
console.log(findPeakInTerrain([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) === 0);
console.log(findPeakInTerrain([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) === 9);

// All test cases should log true
