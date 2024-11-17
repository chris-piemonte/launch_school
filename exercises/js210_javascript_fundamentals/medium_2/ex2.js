// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };

// console.log(person === otherPerson);    // false -- expected: true

// It is false because the equality operator is testing whether the object references are the same, not if the data inside is equivalent.

// console.log(person.name === otherPerson.name);

// Can also make the object references the same for both constants

const person = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson);
