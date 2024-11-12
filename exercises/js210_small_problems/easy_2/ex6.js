const readLine = require('readline-sync');

let noun = readLine.question('Enter a noun: ');
let verb = readLine.question('Enter a verb: ');
let adjective = readLine.question('Enter an adjective: ');
let adverb = readLine.question('Enter an adverb: ');

console.log(`Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`);
