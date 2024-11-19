function centerOf(string) {
  if (string.length % 2 === 0) {
    return string.slice(string.length / 2 - 1, string.length / 2 + 1);
  } else {
    return string.slice(string.length / 2, string.length / 2 + 1);
  }
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"
