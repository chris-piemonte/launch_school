function greetings(array, object) {
  let name = array.reduce((name, part) => name += ' ' + part);
  let job = object.title + ' ' + object.occupation;

  console.log(`Hello ${name}! Nice to have a ${job} around!`);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.
