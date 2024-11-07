var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

// 'This is local' because line 4 is reassignment of a global variable that is in someFunction()'s closure.
