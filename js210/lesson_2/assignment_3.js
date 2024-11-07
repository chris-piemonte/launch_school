function average(array) {
  return sum(array) / array.length;
}

function sum(array) {
  let total = 0;
  array.forEach(num => total += num);
  return total;
}

console.log(average([5, 10, 15, 20, 25]));

let temperatures = [7,2,4,78,98]
console.log(average(temperatures));
