function twice(num) {
  let string = String(num);
  if (string.substring(0, string.length / 2) === string.substring(string.length / 2)) {
    return num;
  } else {
    return num * 2;
  }
}

console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676
