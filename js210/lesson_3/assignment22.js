function indexOf(firstString, secondString) {
  for (let i = 0; i < firstString.length; i += 1) {
    if (firstString[i] === secondString[0]) {
      let substringCheck = true;
      for (let j = i; (j - i) < secondString.length; j += 1) {
        if (firstString[j] !== secondString[j - i]) {
          substringCheck = false;
          break;
        }
      }
      if (substringCheck) return i;
    }
  }
  return -1;
}

function lastIndexOf(firstString, secondString) {
  let index = -1

  for (let i = 0; i < firstString.length; i += 1) {
    if (firstString[i] === secondString[0]) {
      let substringCheck = true;
      for (let j = i; (j - i) < secondString.length; j += 1) {
        if (firstString[j] !== secondString[j - i]) {
          substringCheck = false;
          break;
        }
      }
      if (substringCheck) index = i;
    }
  }
  return index;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
