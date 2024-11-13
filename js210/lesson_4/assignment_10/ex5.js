function uniqueElements(arr) {
  let newArray = []

  arr.forEach(ele => {
    if (!newArray.includes(ele)) newArray.push(ele)
  });

  return newArray
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]
