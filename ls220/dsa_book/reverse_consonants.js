// Given a string `str`, reverse all the consonants in the string and return it.
// Consonants are all alphabetic characters except for the vowels `'a'`, `'e'`, `'i'`,
// `'o'`, and `'u'`, which can appear in both lower and upper cases.
// The consonants can appear more than once in the string.

// Naive Approach O(N)

function reverseConsonants(string) {
  string = string.split('');
  let consonants = []

  string.forEach(char => {
     if (/[^aeiou]/i.test(char)) {
      consonants.push(char);
     }
  });

  string.forEach((char, ind) => {
    if (/[^aeiou]/i.test(char)) {
     string[ind] = consonants.pop();
    }
 });

 return string.join('');
}

// Two Pointer: Start/End

function reverseConsonants(string) {
  string = string.split('');
  let start = 0;
  let end = string.length - 1;

  while (start < end) {
    if (/[^aeiou]/i.test(string[start]) && /[^aeiou]/i.test(string[end])) {
      [string[start], string[end]] = [string[end], string[start]];
      start += 1;
      end -= 1;
    }

    if (/[aeiou]/i.test(string[start])) start += 1;
    if (/[aeiou]/i.test(string[end])) end -= 1;
  }

  return string.join('');
}

console.log(reverseConsonants("") === "");
console.log(reverseConsonants("s") === "s");
console.log(reverseConsonants("HELLO") === "LELHO");
console.log(reverseConsonants("leetcode") === "deectole");
console.log(reverseConsonants("example") === "elapmxe");
console.log(reverseConsonants("Consonants") === "sotnonasnC");

// All test cases should log true
