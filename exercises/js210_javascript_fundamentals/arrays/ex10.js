function areArraysEqual(array1, array2) {
  if (array1.length !== array2.length) return false;
  
  let copyArray1 = array1.toSorted();
  copyArray1.sort((a, b) => {
    if (typeof a === 'string') return -1
  });

  let copyArray2 = array2.toSorted();
  copyArray2.sort((a, b) => {
    if (typeof a === 'string') return -1
  });


  for (i = 0; i < copyArray1.length; i += 1) {
    if (copyArray1[i] !== copyArray2[i]) return false;
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
console.log(areArraysEqual([1, '1'], ['1', 1]));                    // true
