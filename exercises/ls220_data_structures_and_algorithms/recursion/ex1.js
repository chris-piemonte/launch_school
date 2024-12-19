function reverseString(string) {
  const array = [...string];
  let start = 0;
  let end = array.length - 1;

  function helper(start, end) {
    if (start >= end) return;

    [array[start], array[end]] = [array[end], array[start]];
    helper(start + 1, end - 1);
  }

  helper(start, end);
  return array.join('');
}

console.log(reverseString("hello") === "olleh");
console.log(reverseString("world") === "dlrow");
console.log(reverseString("a") === "a");
console.log(reverseString("") === "");
console.log(reverseString("recursion") === "noisrucer");

// All test cases should log true.
