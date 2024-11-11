function multisum(num) {
  array = []

  for (let i = 3; i <= num; i += 1) {
    if (i % 3 === 0 || i % 5 === 0) array.push(i);
  }

  return array.reduce((sum, num) => sum + num);
}

console.log(multisum(3));       // 3
console.log(multisum(5));       // 8
console.log(multisum(10));      // 33
console.log(multisum(1000));    // 234168
