'use strict';

const readLine = require('readline-sync');

let age = Number(readLine.question('What is your age? '));
let retirement = Number(readLine.question('What age would you like to retire? '));
let yearsToGo = retirement - age;

let date = new Date().getFullYear();

console.log(`It's ${date}. You will retire in ${date + yearsToGo}.\nYou only have \
${yearsToGo} years of work to go!`);
