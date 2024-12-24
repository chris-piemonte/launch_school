// Write a function named findTruckCapacity that determines
// the optimal capacity for a delivery truck to transport
// a series of orders within a given number of trips.

// The function takes two parameters:
// 1. An array of positive integers orderVolumes, where each
// element represents the volume of an order in cubic meters.
// 2. A positive integer maxTrips, representing the maximum
// number of trips the truck can make.

// The truck must deliver orders in the sequence they appear
// in the orderVolumes array. On each trip, the truck is
// loaded with as many consecutive orders as possible without
// exceeding its capacity. The function should return the
// minimum truck capacity in cubic meters.

// Example:
// Input: orderVolumes = [6, 3, 8, 2, 5, 4, 5], maxTrips = 3
// Output: 14
// Explanation: A truck with 14 cubic meters capacity can
//              deliver all orders in 3 trips:
// Trip 1: 6 + 3 = 9 cubic meters
// Trip 2: 8 + 2 = 10 cubic meters
// Trip 3: 5 + 4 + 5 = 14 cubic meters

/*

---PROBLEM---
input: array of package sizes, maximum trips a truck can take
output: most efficient size of truck to deliver all packages
  - smallest size a truck can be while delivering all packages in arg 2 number of trips

rules:
  - all packages must be delivered in order of array elements
  - array elements in no specific size order
  - truck size will be the size of the largest volume (sumof elements) in 1 trip
  - min and max volume will be size of smallest element, sum of entire array


---DATA---
- binary search of sizes of trucks
  - iterate through array adding elements until size exceeds current size

---ALGORITHM---
- find min and max truck size can be
  - set a minimum variable to first array element
  - set a maximum variable to 0
  - iterate through the array from beginning to end
    - add each element to max
    - if min is greater than an element, reassign it

- find the average of these sizes and see if the deliveries can be made in arg2 # of trips
  - add min and max, divide by 2
  - iterate through the input array
    - have a variable to track current size, a variable to track number of trips
    - add elements to current size until it exceeds the average
      - reassign current size to 0, increment number of truips by 1
    - check if # of trips was <= arg2
      - if so, decrease the max size of the trucks to the average
      - if not, increase the min size of the trucks to the average
  - when the min size > max size, return the min

*/

function findTruckCapacity(orderVolumes, maxTrips) {
  let min = orderVolumes[0], max = 0;
  for (let num of orderVolumes) {
    max += num;
    if (min < num) min = num;
  }

  while (min <= max) {
    const volume = Math.floor((min + max) / 2);
    let trips = 1;
    let currentVolume = 0;

    for (let num of orderVolumes) {
      currentVolume += num;

      if (currentVolume > volume) {
        trips += 1;
        currentVolume = num;
      }
    }

    if (trips > maxTrips) {
      min = volume + 1;
    } else {
      max = volume - 1;
    }
  }

  return min;
}

console.log(findTruckCapacity([6, 3, 8, 2, 5, 4, 7], 3) === 15);
console.log(findTruckCapacity([3, 2, 5, 8, 4], 3) === 10);
console.log(findTruckCapacity([1, 2, 3, 4, 5], 1) === 15);
console.log(findTruckCapacity([10, 20, 30, 40, 50], 5) === 50);
console.log(findTruckCapacity([5, 5, 5, 5, 5], 2) === 15);
console.log(findTruckCapacity([7, 3, 9, 4, 2, 8, 6], 2) === 20);
console.log(findTruckCapacity([100], 1) === 100);
console.log(findTruckCapacity([1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 3) === 4);
console.log(findTruckCapacity([10, 20, 30, 40, 50], 2) === 90);
console.log(findTruckCapacity([50, 40, 30, 20, 10], 3) === 60);
console.log(findTruckCapacity([5, 10, 15, 20, 25], 1) === 75);
console.log(findTruckCapacity([3, 2, 4, 1, 5], 10) === 5);
console.log(findTruckCapacity([1000, 1000, 1000, 1000], 3) === 2000);
