// const readLine = require('readline-sync');

// let width = Number(readLine.question("What is the width of the room in meters? \n"));
// let height = Number(readLine.question("What is the height of the room in meters? \n"));

// let areaMeters = (width * height).toFixed(2);
// let areaFeet = (areaMeters * 10.7639).toFixed(2)

// console.log(`The area of the room is ${areaMeters} meters squared or ${areaFeet} feet squared.`);

const readLine = require('readline-sync');

let units = readLine.question('Do you want to measure the room in meters or feet? \n');

for (; units !== 'meters' && units !== 'feet';) {
  units = readLine.question('That is not a valid answer, please choose meters or feet. \n');
}

let width = Number(readLine.question("What is the width of the room? \n"));
let height = Number(readLine.question("What is the height of the room? \n"));

let area = (width * height).toFixed(2);

console.log(`The area of the room is ${area} ${units} squared.`);
