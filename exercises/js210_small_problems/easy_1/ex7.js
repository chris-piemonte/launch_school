// function isLeapYear(year) {
//   if (year % 4 === 0 ) {
//     if (year % 100 === 0) {
//       if (year % 400 === 0) return console.log(true);
//       return console.log(false);
//     }
//     return console.log(true);
//   } else {
//     return console.log(false);
//   }
// }

const isLeapYear = (year) => (year % 400 === 0) || (year % 4 === 0 && year % 100 !== 0);

console.log(isLeapYear(2016));      // true
console.log(isLeapYear(2015));      // false
console.log(isLeapYear(2100));      // false
console.log(isLeapYear(2400));      // true
console.log(isLeapYear(240000));    // true
console.log(isLeapYear(240001));    // false
console.log(isLeapYear(2000));      // true
console.log(isLeapYear(1900));      // false
console.log(isLeapYear(1752));      // true
console.log(isLeapYear(1700));      // false
console.log(isLeapYear(1));         // false
console.log(isLeapYear(100));       // false
console.log(isLeapYear(400));       // true
