function negative(num) {
  return -Math.abs(num);
}

console.log(negative(5));     // -5
console.log(negative(-3));    // -3
console.log(negative(0));     // -0

function negative(num) {
  return num >= 0 ? -num : num;
}
