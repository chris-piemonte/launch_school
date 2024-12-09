/*
Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

The rules are as follows:

If the phone number is less than 10 digits, assume that it is a bad number.
If the phone number is 10 digits, assume that it is good.
If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
If the phone number is 11 digits and the first number is not 1, then it is a bad number.
If the phone number is more than 11 digits, assume that it is a bad number.
For bad numbers, just a return a string of 10 0s.


---PROBLEM---
input:
  - string
output:
  - string of phone number formatted

rules:
  - if string is bad number, return a string of 10 0s
    - if the phone number < 10 digits
    - if the phone number is 11 digits and the first digit isn't 1
    - if the phone number is more than 11 digits
  - non-digit characters should be ignored
  - if input is 10 digits, assume it is good
  - if the input is 11 digits and first digit is 1, trim first 1 and assume it's good

Questions:
  - what should the output formatting look like? Dashes, commas, only digits?
  - Will the input always be a string? Could it be an array of digits?
  - What delimits numbers in the string? Is 15 a 1 & 5 or 15?
    - Are the digits only 0 - 9?
  - Should negative numbers be ignored? Does - mean negative number or is it a delimiter?
  - If there are less than 10 digits is it a bad number?
  - can there be more than one argument? What should I do?
  - does the output have to be a new string?

---DATA---
  - input string
    - use regex to create string of just digits to verify and return

---ALGORITHM---
High Level:
1. Use regex to create string of only digits
2. Check if new string is valid
3. If valid, return new string. If not, return string of 10 0s

Detail:
1. Use regex to create string of only digits
  - Crreate a regex pattern of only digits, match it to input string (will create array)
  - join array back together into single string, no delimiters
2. Check if new string is valid with helper method validNumber(phoneNumber)
  - reassign `phoneNumber` to return value of function
3. Return `phoneNumber`

Helper: validNumber(phoneNumber)
  - check the length of the phone number
    - if it's 10 characters, return phone umber
    - if it's 11 characters, check first character
      - if 1, return phone number with first character sliced off
    - return string of 10 0s if haven't returned already from above

*/

function cleanPhoneNumber(string) {
  if (typeof string !== 'string') return '0000000000';
  phoneNumber = string.replace(/[\D]/g, '');
  phoneNumber = validNumber(phoneNumber)

  return phoneNumber;
}

function validNumber(phoneNumber) {
  if (phoneNumber.length === 10) return phoneNumber;
  if (phoneNumber.length === 11) {
    if (phoneNumber[0] === '1') {
      return phoneNumber.slice(1);
    }
  }

  return '0000000000';
}

// 10 digits
console.log(cleanPhoneNumber('1111111111') === '1111111111');
console.log(cleanPhoneNumber('9876543210') === '9876543210');
console.log(cleanPhoneNumber('7385968372') === '7385968372');

// 10 digits with other symbols
console.log(cleanPhoneNumber('123$$567*&7563') === '1235677563');
console.log(cleanPhoneNumber('(123456)789(0)') === '1234567890');
console.log(cleanPhoneNumber('73$85%96^83&72') === '7385968372');

// 11 digits with & without 1
console.log(cleanPhoneNumber('11111111111') === '1111111111');
console.log(cleanPhoneNumber('98765432101') === '0000000000');
console.log(cleanPhoneNumber('15487936528') === '5487936528');


// impropr length
console.log(cleanPhoneNumber('111111') === '0000000000');
console.log(cleanPhoneNumber('9876543656512101') === '0000000000');
console.log(cleanPhoneNumber('123456789') === '0000000000');
console.log(cleanPhoneNumber('123456789012') === '0000000000');
console.log(cleanPhoneNumber('abcdefghij') === '0000000000');
console.log(cleanPhoneNumber('') === '0000000000');
console.log(cleanPhoneNumber() === '0000000000');
console.log(cleanPhoneNumber(25) === '0000000000');
console.log(cleanPhoneNumber([4,5,6]) === '0000000000');
