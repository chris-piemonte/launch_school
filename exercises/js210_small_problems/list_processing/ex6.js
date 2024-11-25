function leadingSubstrings(string) {
  const substrings = [];

  for (let i = 1; i <= string.length; i += 1) {
    substrings.push(string.slice(0, i));
  }

  return substrings;
}

function substrings(string) {
  let substrings = [];

  for (let ind = 0; ind < string.length; ind += 1) {
    substrings = substrings.concat(leadingSubstrings(string.slice(ind)));
  }

  return substrings;
}

console.log(substrings('abcde'));

/* returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]
  */

function substrings(string) {
  return [...string].flatMap((_, ind) => leadingSubstrings(string.slice(ind)));
}
