/*

---PROBLEM---
input: array
output: new array, rotated

rules:
  - input will be an array
  - array can contain any element
  - array can be empty
    - return an empty array
  - argument can be not an arrray or missing
    - return undefined
  - do not mutate the array

---DATA---
- 2nd array
  - can make copy of the first array

---ALGORITHM---
- validate the input
  - if input isn't array, return uundefined
- create a copy of the array
  - slice the array with no arguments
- reassign the copied array
  - pop the last element off
  - push popped element to the front of the array
- return the mutated copy array

*/

function rotateArray(array) {
  if (!Array.isArray(array)) return undefined;
  if (array.length === 0) return []

  copy = array.slice();
  copy.push(copy.shift());
  return copy
}

console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
console.log(rotateArray(['a']));                    // ["a"]
console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []

// return `undefined` if the argument is not an array
console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
console.log(rotateArray(array));                    // [2, 3, 4, 1]
console.log(array);                                 // [1, 2, 3, 4]
