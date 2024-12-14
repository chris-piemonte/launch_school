// Given an array of numbers, return its majority element.

// The majority element is the value in the array that appears
// as at least half of the elements in the array.

// It is guaranteed that only one majority element exists in the array.


function findMajority(array) {
  let count = 0
  let half = Math.ceil(array.length / 2);

  for (let ind = 0; ind < array.length; ind += 1) {
    let num = array[ind]
    for (let inner = ind; inner < array.length; inner += 1) {
      if (array[inner] === num) count += 1
    }

    if (count >= half) return num;
  }
}

function findMajority(array) {
  let map = new Map();
  let half = Math.ceil(array.length / 2);

  for (let ind = 0; ind < array.length; ind += 1) {
    map.set(array[ind], map.has(array[ind]) ? map.get(array[ind]) + 1 : 1);

    if (map.get(array[ind]) >= half) return array[ind];
  }
}

console.log(findMajority([6, 4, 4, 6, 4]) === 4);
console.log(findMajority([4, 5, 2, 5, 5, 5, 1]) === 5);
console.log(findMajority([1, 2, 1, 2, 2, 1, 2]) === 2);
console.log(findMajority([1, 2, 3, 1, 4, 4, 1, 1]) === 1);
console.log(findMajority([5, 5, 5]) === 5);

// All test cases should log true
