/*
You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

"1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
"1-3, 1-2" --> 1, 2, 3, 11, 12
"1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
"104-2" --> 104, 105, ... 112
"104-02" --> 104, 105, ... 202
"545, 64:11" --> 545, 564, 565, .. 611

---PROBLEM---
input: string of numbers in comma separated ranges
output: complete list of numbers in long form

rules:
  - input is in short-hand ranges
    - comma separated
    - ranges can use combination of folloring separators:
      - '-'
      - ':'
      - '..'
  - each additional number will only have 1s digit (or however many digits from right)
    - must be next possible lowers number after last number
  - empty strings, negatives, non-digit strings return undefined

questions:
  - can arguments only be string?
  - what if strings contain non digits/ranges?
  - can string be empty?
  - what if more than 1 argument?
  - what if no arguments?
  - what type should the return value be? array?
  - can there be negative numbers or ranges?
  - can there be multiple separators in a row?

---DATA---
  - array to contain list of return numbers
  - split input string into array of numbers and ranges for return list

---ALGORITHM---
1. Check if input is valid
  - if input isn't string return `undefined`
  - using regex check if string contains anything but digits, spaces, commas, -, :, .., or multiple separaters in a row   If so retrun undefined
2. Replace all separators in string with '-'
  - Use regex to replace all :, .. with -
2. Create a `result` array to store return numbers of range
3. Split input string into array with comma delimiters
  - using split, create an array of string elements with , as the delimeter
4. Iterate through array of numbers. If element single number, push to `result` using short-hand rules. If element contains range, push numbers from left side of range to right side into `results` until right side of range is pushed.
  - Iterate through array using `for` loop with 0 as the initializor, continue while initializor is less than the array length, increment the initializor by 1
    - check if the current array element is only digits
      - if yes
        - start a `for` loop & create a `counter` outside the `for` loop set to last element of `result` + 1. (If no elements in `result` convert current element to number & push to result, continue to next loop iteration)
          - compare the current element to the ending of `counter` converted to string. If it matches, convert `counter` to number and push to `result` & break out of `for` loop
      - if no
        - split element into array of 2 numbers using - as the delimiter
        - for element 0
          - start a `for` loop & create a `counter` outside the `for` loop set to last element of `result` + 1. (If no elements in `result` convert current element to number & push to result, continue to next loop iteration)
          - compare the current element to the ending of `counter` converted to string. If it matches, convert `counter` to number and push to `result` & break out of `for` loop
        - for element 1
          - start a `for` loop & create a `counter` outside the `for` loop set to last element of `result` + 1. (If no elements in `result` convert current element to number & push to result, continue to next loop iteration)
            - push counter to `result`
            - compare the current element to the ending of `counter` converted to string. If it matches, break out of `for` loop
6. Return `result`
  -After iteration complete, return `result` array

*/

// function longForm(string) {
//   if (typeof string !== 'string') return undefined;
//   if (/[^-\d ,:\.]/.test(string) || string == '') return undefined;
//   string = string.replace(/ /g, '');
//   string = string.replace(/(\:|\.{2})/g, '-');

//   let result = [];

//   array = string.split(',');
//   for (let arrInd = 0; arrInd < array.length; arrInd += 1) {
//     if (/\D/.test(array[arrInd])) {
//       let range = array[arrInd].split('-');
//       let counter = result.length === 0 ? 0 : result[result.length - 1] + 1;
//       let num = range[0]
//       for (; ; counter += 1) {
//         if (String(counter).endsWith(num)) {
//           result.push(counter);
//           break;
//         }
//       }
//       for (let ele = 1; ele < range.length; ele += 1) {
//         counter = result[result.length - 1] + 1;
//         num = range[ele];
//         for (; ; counter += 1) {
//           result.push(counter);
//           if (String(counter).endsWith(num)) {
//             break;
//           }
//         }
//       }
//     } else {
//       let counter = result.length === 0 ? 0 : result[result.length - 1] + 1;
//       let num = array[arrInd];
//       for (; ; counter += 1) {
//         if (String(counter).endsWith(num)) {
//           result.push(counter);
//           break;
//         }
//       }
//     }
//   }

//   return result;
// }

// Tests
console.log(longForm("1, 3, 7, 2, 4, 1"))
console.log(longForm("1-3, 1-2"))
console.log(longForm("1:5:2"))
console.log(longForm("104-2"))
console.log(longForm("104-02"))
console.log(longForm("545, 64:11"))
console.log(longForm("545, 64..11"))


// undefined
console.log(longForm() === undefined)
console.log(longForm('') === undefined)
console.log(longForm('awfeawef') === undefined)
console.log(longForm("1, 3, 7, 't', 2, 4, 1, 's'") === undefined)
console.log(longForm(-5) === undefined)
console.log(longForm([1, 3, 7, 2, 4, 1]) === undefined)
console.log(longForm([1, 3, 7, 2, 4, 1], "1, 3, 7, 2, 4, 1") === undefined)


function longForm(string) {
  if (typeof string !== 'string') return undefined;
  if (/[^-\d ,:\.]/.test(string) || string == '') return undefined;
  string = string.replace(/ /g, '');
  string = string.replace(/(\:|\.{2})/g, '-');

  let result = [];

  array = string.split(',');
  for (let arrInd = 0; arrInd < array.length; arrInd += 1) {
    if (/\D/.test(array[arrInd])) {
      let range = array[arrInd].split('-');
      let counter = result.length === 0 ? 0 : result[result.length - 1];
      let num = range[0]
      do {
        counter += 1
      } while (!String(counter).endsWith(num));
      result.push(counter);
      for (let ele = 1; ele < range.length; ele += 1) {
        counter = result[result.length - 1];
        num = range[ele];
        do {
          counter += 1
          result.push(counter);
        } while (!String(counter).endsWith(num));
      }
    } else {
      let counter = result.length === 0 ? 0 : result[result.length - 1] + 1;
      let num = array[arrInd];
      do {
        counter += 1
      } while (!String(counter).endsWith(num));
      result.push(counter);
    }
  }

  return result;
}
