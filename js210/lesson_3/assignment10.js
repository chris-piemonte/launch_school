const readSync = require('readline-sync');
grades = []

for (let i = 1; i <= 3; i += 1) {
  grades.push(Number(readSync.question(`Enter score ${i}: `)));
}

let score = grades.reduce( (sum, grade) => sum + grade)
let average = score / 3
let grade = 'F';

if (average >= 90) {
  grade = 'A'
} else if (average >= 80) {
  grade = 'B'
} else if (average >= 70) {
  grade = 'C'
} else if (average >= 60) {
  grade = 'D'
}

console.log(`Based on he average of your 3 scores your letter grade is ${grade}.`);
