function oddElementsOf(arr) {
  newArray = []

  for (let i = 1; i < arr.length; i += 2) {
    newArray.push(arr[i]);
  }

  return newArray;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));    // returns [8, 16, 42]
