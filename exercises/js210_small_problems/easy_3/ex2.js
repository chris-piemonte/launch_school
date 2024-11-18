// 'use strict';

// const readLine = require('readline-sync');
// const order = ['1st', '2nd', '3rd', '4th', '5th', 'last'];
// const answers = [];

// for (let i = 0; i < order.length; i += 1) {
//   answers.push(readLine.question(`Enter the ${order[i]} number: `));
// }

// let appears;
// if (answers.slice(0, answers.length - 1).includes(answers[answers.length - 1])) {
//   appears = 'appears';
// } else {
//   appears = 'does not appear';
// }

// console.log(`The number ${answers[answers.length - 1]} ${appears} in [${answers.slice(0, answers.length - 1)}]`);

// function isIncluded(arr, val) {
//   for (let i = 0; i < arr.length; i += 1) {
//     if (arr[i] === val) {
//       return true;
//     }
//   }

//   return false;
// }

// const readLine = require('readline-sync');
// const order = ['1st', '2nd', '3rd', '4th', '5th', 'last'];
// const answers = [];

// for (let i = 0; i < order.length; i += 1) {
//   answers.push(readLine.question(`Enter the ${order[i]} number: `));
// }

// let appears;
// if (isIncluded(answers.slice(0, answers.length - 1), answers[answers.length - 1])) {
//   appears = 'appears';
// } else {
//   appears = 'does not appear';
// }

// console.log(`The number ${answers[answers.length - 1]} ${appears} in [${answers.slice(0, answers.length - 1)}]`);


function isIncludedSome(array, value) {
  return array.some(num => num > value);
}

console.log(isIncludedSome([1,2,3,4,5], 3));
console.log(isIncludedSome([1,2,3,4,5], 6));
