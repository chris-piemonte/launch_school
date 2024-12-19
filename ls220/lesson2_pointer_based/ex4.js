// Write a function `longestSubstringLength` that finds the
// length of the longest substring without duplicates in a
// given string. The function should take a string as input
// and return an integer representing the length of the longest
// substring without any repeating characters. The input
// string will only contain lowercase characters.

// Example:
// Input: s = "helloworld"
// Output: 5
// Explanation: The longest substring without repeating characters is "world",
// which has a length of 5.

/*

---PROBLEM---
input: array of lowercase string letters
output: longest substring w/o repeating characters

rules;
- input is all lowercase letters
  - no non-alphatbetic characters
  - no spaces or hyphens
  - no empty strings
- substrings are in contigious order

---DATA---
- 2 pointers, anchor and runner
- array of "seen" characters

---ALGORITHM---
- create variables needed for itteration
  - array to store `seen` characters in current sub-array, include index 0 of string
  - start pointer set to index 0
  - end pointer set to index 0
  - max sub-array length set to 1

- iterate until runner length matches string length
  - if the next letter in the string after the current runner index isn't included in `seen` array
    - increment runner by 1
    - add new index to `seen` array
  - otherwise
    - remove anchor index from `seen`
    - increment anchor by 1
  - check if new sub-array length > current max sub-array length
     if it is reassign it

- return max sub-array length
*/

function longestSubstringLength(string) {
  let included = [string[0]];
  let anchor = 0, runner = 0;
  let maxSubLength = 1;

  while (runner < string.length) {
    if (!included.includes(string[runner + 1])) {
      runner += 1;
      included.push(string[runner]);
    } else {
      included.shift();
      anchor += 1;
    }

    if (maxSubLength < string.slice(anchor, runner + 1).length) {
      maxSubLength = string.slice(anchor, runner + 1).length;
    }
  }

  return maxSubLength;
}

console.log(longestSubstringLength("a") === 1);
console.log(longestSubstringLength("aa") === 1);
console.log(longestSubstringLength("ab") === 2);
console.log(longestSubstringLength("abba") === 2);
console.log(longestSubstringLength("abc") === 3);
console.log(longestSubstringLength("helloworld") === 5);
console.log(longestSubstringLength("dvdf") === 3);
console.log(longestSubstringLength("tmmzuxt") === 5);
console.log(longestSubstringLength("thisishowwedoit") === 6);
console.log(longestSubstringLength("longestsubstring") === 8);
console.log(longestSubstringLength("aabbccddeffghijklmno") === 10);
console.log(longestSubstringLength("abcdefghijklmnopqrstuvwxyz") === 26);
