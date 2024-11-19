function interleave(arr1, arr2) {
  let result = [];

  for (let i = 0, j = 0; i < arr1.length; i += 1, j += 2) {
    result[j] = arr1[i];
  }

  for (let i = 0, j = 1; i < arr2.length; i += 1, j += 2) {
    result[j] = arr2[i];
  }

  return result;
}

console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]
