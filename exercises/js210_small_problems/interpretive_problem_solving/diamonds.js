/*

Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

---PROBLEM---
input: 1 odd integer
output: diamond printed to the screen

rules:
  - will alwayws have an argument
  - argument will always be integer 0 or greater
    - if 0 print empty string
  - always print astericks
  - n will be both x & y axis of grid
  - has to be spaces after diamond on each row
    - all rows mustprint 9 characters including spaces
  - n will always be odd

---DATA---
  - itration from 1 - 9
  - 2 variables to track number of stars & spaces on each iteration
  - print spaces & stars on each iteration

---ALGORITHM---

- if n < 1, return ''

- create variables for total `spaces` & `stars` to print on each iteration
  - set `spaces` = n - 1
  - set `stars` = 1

- loop from 1 - n
  - create a for loop: set counter = 1; while counter <= n; counter += 1
  - print total spaces, stars, spaces; reassign `spaces` & `stars`
    - print spaces & stars w/ `printing(spaces, stars)` HELPER METHOD
    - increment spaces & stars
      - if counter <= (n / 2) ceiling      5
        - increment stars by 2
        - decreases spaces by 2
      - else
        - decrease stars by 2
        - increase spaces by 2


HELPER: printing(spaces, stars)
  - reassign spaces to spaces / 2
  - print ' ' spaces times +
  - print '*' stars times +
  - print ' ' spaces times

*/

function diamond(n) {
  if (n < 1) return console.log('');

  let spaces = n - 1;
  let stars = 1;

  for (let counter = 1; counter <= n; counter += 1) {
    console.log(printing(spaces, stars));

    if (counter < Math.ceil(n / 2)) {
      stars += 2;
      spaces -= 2;
    } else {
      stars -= 2;
      spaces += 2;
    }
  }
}

function printing(spaces, stars) {
  spaces = spaces / 2;

  return ' '.repeat(spaces) + '*'.repeat(stars) + ' '.repeat(spaces)
}

diamond(0);
// // logs
// // ''

diamond(1);
// // logs
// // *

diamond(3);
// // logs
// //  *
// // ***
// //  *

diamond(9);
// logs
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *

diamond(101);
