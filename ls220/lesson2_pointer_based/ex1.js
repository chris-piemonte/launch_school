// Imagine a series of vertical barriers arranged in a straight
// line at equal distances across a flat field.
// These barriers have different heights. After a rainstorm,
// water collects between the barriers, forming reservoirs.
// Your task is to determine the maximum volume of rainwater
// that can be captured between any two barriers, without
// the water spilling over the tops of those two barriers.

// Write a function `maxRainwater` that takes an array of
// barrier `heights` and calculates the maximum volume
// of rainwater that can be harvested between any two barriers.

// The array `heights` represents the height of each barrier,
// where `heights[i]` is the height of the i-th barrier.
// The distance between each barrier is uniform.

// The input array will contain at least 2 values.

// Example:
// Input: [1, 2, 1]
// Output: 2
// Explanation: The distance between the first and
// third barrier is 2, and the height is 1, so
// the maximum amount of rainfall is 2 * 1 = 2

//   |    =>    |
// |_|_|      |*|*|

// Example:
// Input: [2, 3, 4, 2]
// Output: 6
// Explanation: The distance between the first and
// fourth barrier is 3, and the height is 2, so the
// maximum amount of rainfall is 3 * 2 = 6

//     |            |
//   | |    =>    | |
// | | | |      |*|*|*|
// |_|_|_|      |*|*|*|

/*

---PROBLEM---
input: array of heights of barriers
output: max units of water that can be held b/w any 2 barriers

rules:
- each element in the array is an integer that represents barrier height
- heights are all integers
- must have equal height barriers to holdwaterin a 'space'
- return maxunits of water that can be held b/w any 2 barriers
  - NOT max units of water entire structure can hold
- each 2 barriers can hold water distance_apart * smaller_barrier_height

---DATA---
- front and end pointers, iteration

---ALGORITHM---
- create a tracker for current maximum volume

- set pointers to the first and last indexes of the input array:
  - while first < last
    - if the shorter of the indexes * difference in index numbers > current tracker, reassign it
    - if the end index < start index, move it left 1 index
    - if the start index < end index move it right 1 index

- return tracker

*/

function maxRainwater(array) {
  let maxVolume = 0;
  let left = 0;
  let right = array.length - 1;

  while (left < right) {
    const currentVolume = Math.min(array[left], array[right]) * (right - left);
    if (currentVolume > maxVolume) {
      maxVolume = currentVolume;
    }

    if (array[left] <= array[right]) {
      left += 1;
    } else {
      right -= 1;
    }
  }

  return maxVolume;
}

console.log(maxRainwater([1, 1]) === 1);
console.log(maxRainwater([1, 3]) === 1);
console.log(maxRainwater([1, 2, 1]) === 2);
console.log(maxRainwater([2, 3, 4, 2]) === 6);
console.log(maxRainwater([2, 2, 2, 2, 2]) === 8);
console.log(maxRainwater([2, 9, 5, 10, 5, 6]) === 24);
console.log(maxRainwater([5, 4, 3, 2, 9, 10, 3, 4, 5]) === 40);
console.log(maxRainwater([3, 1, 2, 5, 2, 4, 2, 5, 6, 1, 5, 3, 2, 3, 4, 1, 2]) === 44);
console.log(maxRainwater([2, 2, 13, 9, 1, 15, 2, 5, 9, 7, 5, 3, 6, 3, 4, 1, 4, 5]) === 75);
