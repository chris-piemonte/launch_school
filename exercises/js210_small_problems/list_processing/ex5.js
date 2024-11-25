function leadingSubstrings(string) {
  const substrings = [];

  for (let i = 1; i <= string.length; i += 1) {
    substrings.push(string.slice(0, i));
  }

  return substrings;
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

function leadingSubstrings(string) {
  return string.split('').map((_, ind) => string.slice(0, ind + 1));
}
