function reverse(inputForReversal) {
  let string;
  if (typeof inputForReversal === 'string') {
    inputForReversal = inputForReversal.split('');
    string = true;
  }

  result = []
  inputForReversal.forEach(ele => result.unshift(ele));
  if (string === true) result = result.join('');

  return result;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]
