function assignTreats(appetite, treats) {
  appetite = appetite.sort((a, b) => a - b);
  treats = treats.sort((a, b) => a - b);

  let a = 0, t = 0;
  let happyCount = 0;
  while (a < appetite.length && t < treats.length) {
    if (treats[t] >= appetite[a]) {
      happyCount += 1;
      a += 1;
    }
    t += 1;
  }

  return happyCount;
}

console.log(assignTreats([3, 4, 2], [1, 2, 3]) === 2);
console.log(assignTreats([1, 5], [5, 5, 6]) === 2);
console.log(assignTreats([1, 2, 3], [3]) === 1);
console.log(assignTreats([2], [1, 2, 1, 1]) === 1);
console.log(assignTreats([4, 3, 1], [2, 1, 3]) === 2);
console.log(assignTreats([1,2,3], [1,2,3]) === 3);
console.log(assignTreats([4, 5, 6], [1,2,3]) === 0);

// All test cases should log true.
