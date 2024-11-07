const rlSync = require('readline-sync');
phrase = rlSync.question("Please enter a phrase: \n")

phrase2 = phrase.replaceAll(/ /g, '');

console.log(`There are ${phrase2.length} cahracters in "${phrase}".`);

phrase3 = phrase.replaceAll(/[^a-z]/gi, '');

console.log(`There are ${phrase3.length} cahracters in "${phrase}".`);
