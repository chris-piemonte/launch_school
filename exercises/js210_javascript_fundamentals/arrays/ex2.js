let myArray = [1, 2, 3, 4];
// const myOtherArray = myArray.slice(); // option 1
const myOtherArray = myArray.map(ele => ele); // option 2

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);
