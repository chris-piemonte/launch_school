var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

// It will log 'This is global' because on line 4 of the function a new local variable s being declared.
