function rotateRightmostDigits(number, n) {
  let array = String(number).split('');

  for (let i = array.length - n; i < array.length - 1; i += 1) {
    [array[i], array[i + 1]] = [array[i + 1], array[i]];
  }

  return Number(array.join(''));
}

function maxRotation(num) {
  for (let ind = String(num).length; ind > 0; ind -= 1) {
    num = rotateRightmostDigits(num , ind);
  }

  return num;
}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845
