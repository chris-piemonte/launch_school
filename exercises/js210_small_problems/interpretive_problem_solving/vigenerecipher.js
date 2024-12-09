/*

The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:

plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!
Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').

---PROBLEM---
- input: plaintext string, keyword string 
- output: String of encrypted message

rules:
  - first argument will always be a string
  - argument salways in correct order
    - keyword argument can be empty
      - return string unencrypted
  - plaintext will always be a non-empty string
    - can contain no aplhabetic characters
  - input plaintext will be emcrypted using keyword
    - iterate through keyword, using each character to encrypt each corresponding character of input plaintext in sequence
      - keyword characters represent a shift of 0 - 25 from a - z
        - case doesn't matter for the keyword
      - case does matter for plaintext
      - any non-aplhabetic characters should stay the same
      - keyword is only alphabetic

---DATA---
- arrays to track plaintext shift & keyword characters
  - 1 index for keypword letters & lowercase shift
  - 1 index for uppercase shift

---ALGORITH---
- validate input data
  - if 2nd argument undefined or first argument empty string or doens't contain letters, return `plaintext` unchanged

- create 2 strings of a - z & A - Z

- reassign keyword to lowercase version

- split`plaintext` into an array of characters called `chars`
  - split using '' as delimeter

- iterate through `chars`, pushing characters (shifted & non-shifted) to new string
  - create new string called `result`
  - create a counter called keyInd set to 0
  - create a for loop: set a counter to 0, while counter < length of `chars`, increment counter by 1
  - if `chars` element is a - z (regex)
    - shift `chars` letter by keyword amount
      - create variable `shift` set to index of lowercase array at (keyword at keyInd)
    - create variable `newInd` = `shift` + index of lowercase array at (chars ele)
      -if `newInd` > 25, subtract 26
      - concatenate lowercase array at `newInd` to `result`
    - if `chars` element is A - Z (regex)
    - shift `chars` letter by keyword amount
      - create variable `shift` set to index of uppercase array at (keyword at keyInd)
    - create variable `newInd` = `shift` + index of uppercase array at (chars ele)
      -if `newInd` > 25, subtract 26
      - concatenate uppercase array at `newInd` to `result`
    - else
      - concateneate element to `result`'
    - increment keyInd by 1
    - if keyInid >= keyind length, reassign to 0

- rejoin string and return

*/

function encrypt(plaintext, keyword) {
  if (keyword === undefined || plaintext == '') return plaintext;
  keyword = keyword.toLowerCase()

  const lowercase = 'abcdefghijklmnopqrstuvwxyz';
  const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const chars = [...plaintext];

  let result = '';
  let keyInd = 0;
  for (let charsInd = 0; charsInd < chars.length; charsInd += 1) {
    if (/[a-z]/.test(chars[charsInd])) {
      let shift = lowercase.indexOf(keyword[keyInd]);
      let newInd = lowercase.indexOf(chars[charsInd]) + shift;
      if (newInd > 25) newInd -= 26;
      result += lowercase[newInd];
    } else if (/[A-Z]/.test(chars[charsInd])) {
      let shift = lowercase.indexOf(keyword[keyInd]);
      let newInd = uppercase.indexOf(chars[charsInd]) + shift;
      if (newInd > 25) newInd -= 26;
      result += uppercase[newInd];
    } else {
      result += chars[charsInd];
    }

    if (/[a-zA-Z]/.test(chars[charsInd])) keyInd += 1
    if (keyInd >= keyword.length) keyInd = 0;
  }

  return result;
}

console.log(encrypt("Pineapples don't go on pizzas!", 'mEaT'));
// Bmnxmtpeqw dhz'x gh ar pbldal!

console.log(encrypt("Pineapples don't go on pizzas!"));
// // Pineapples don't go on pizzas!

console.log(encrypt("", 'test'));
// // ''

console.log(encrypt("^&%**^    823y93,2", 'meat'));

console.log(encrypt("abc defg", 'abc'));
// // ace dfhg

console.log(encrypt("ABC", 'BC'));
// bdd
