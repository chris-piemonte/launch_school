function getSelectedColumns(numbers, cols) {
  var result = [];

  for (var i = 0, length = numbers.length; i < length; i += 1) {
    for (var j = 0, length = cols.length; j < length; j += 1) {
      if (!result[j]) {
        result[j] = [];
      }

      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

// given the following arrays of number arrays
const array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
const array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// `array1` in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

getSelectedColumns(array1, [0]);     // [[1]];            expected: [[1, 4, 7]]
getSelectedColumns(array1, [0, 2]);  // [[1, 4], [3, 6]]; expected: [[1, 4, 7], [3, 6, 9]]
getSelectedColumns(array2, [1, 2]);  // [[2, 2], [3, 3]]; expected: [[2, 2, 2], [3, 3, 3]]

// it des not work because on line 4 `length` is declared with `var` so it has global scope. Then on line 5 the same `var` is being reassigned to the length of the 2nd argument, cutting short how many iterations happen on the outer for
