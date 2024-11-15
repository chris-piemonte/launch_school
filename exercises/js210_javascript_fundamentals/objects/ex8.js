function penultimate(string) {
  return string.split(' ')[-2];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"

// it returns unidentified every time because you can't index an array backwards with negative numbers

function penultimate(string) {
  return string.split(' ')[string.split(' ').length - 2];
}

function penultimate(string) {
  return string.split(' ').slice(-2, -1)[0];
}
