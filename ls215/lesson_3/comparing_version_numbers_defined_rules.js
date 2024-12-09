/*
While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:
1
1.0
1.2
3.2.3
3.0.0
4.2.3.0

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

If version1 > version2, we should return 1.
If version1 < version2, we should return -1.
If version1 === version2, we should return 0.
If either version number contains characters other than digits and the . character, we should return null.

0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

---PROBLEM---
- Input:
  - 2 strings, made up of digits and decimal points
- Output:
  - if version1 > version 2, return 1
  - if version1 < version 2, return -1
  - if version1 === version 2, return 0
  - if either version contains anything other than string with ditits and decimals, return null

- rules:
  - 2 arguments
    - both strings
    - both strings contain only digits and decimals
      - if not, return null
  - decimals and 0s don't affect equality
    - 1 === 1.0 === 1.0.0.0
  - compare the numbers between each decimal from left to right
    - smaller number between same decimal spots means that version is less than
  - if version1 > version 2, return 1
  - if version1 < version 2, return -1
  - if version1 === version 2, return 0

---DATA---
- make an array for each version
  - each element is strings between the decimals
    - convert the strings to numbers
  - compare arrays at same indexes, if elements match go to next element

---ALGORITHM---
High Level:
1. Check each string for characters other than digits and decimals, return `null` if other characters found or at least one argument missing
2. Create an array for each version, elements are strings delimited by decimals
3. iterate through the indexes of both arrays, comparing each element at equivalent indeces
4. return result baased on comparison

Detail:
1. Check each string for characters other than digits and decimals, return `null` if other characters found or at least one argument missing
  - check full strings using regex
  - return null if either version != string
2. Create an array for each version, elements are strings delimited by decimals
  - split the string into an array using decimals as delimeter
    - if multiple decimals, don't include empty strings in array
  - reassign the arrays using transformation, turning each element from a string to a number
3. iterate through the indexes of both arrays, comparing each element at equivalent indeces using helper method compareNumbers(version1, version2)
4. return result baased on comparison

Helper: compareNumbers(version1, version2)
  - create a retrun element, set to 0
  - iterate through each element in version 1 with element and index parameters
  - compare the element to the element in version 2 at the same index
    - if the element < element in version 2, return -1
    - if the element > element in version 2, return 1
    - if the element === element in version 2, do nothing
  - return the result element

*/
function compareVersions(version1, version2) {
  if (typeof version1 != 'string' || typeof version2 != 'string') return null;
  let validChars = /^[\d]+(\.[\d]+)*$/;
  if (!validChars.test(version1) || !validChars.test(version2)) return null;

  version1 = version1.match(/\d+/g).map(Number);
  version2 = version2.match(/\d+/g).map(Number);
  
  return compareNumbers(version1, version2);
}

function compareNumbers(version1, version2) {
  while (version1.length !== version2.length) {
    if (version1.length < version2.length) version1.push(0);
    if (version1.length > version2.length) version2.push(0);
  }

  for (let ind = 0; ind < version1.length; ind += 1) {
    if (version1[ind] < version2[ind]) {
      return -1
    } else if (version1[ind] > version2[ind]) {
      return 1
    }
  }

  return 0;
}

console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1
