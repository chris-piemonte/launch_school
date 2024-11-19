function union(arr1, arr2) {
  const newArray = arr1.slice();

  arr2.forEach(ele => {
    if (!arr1.includes(ele)) newArray.push(ele);
  });

  return newArray;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
