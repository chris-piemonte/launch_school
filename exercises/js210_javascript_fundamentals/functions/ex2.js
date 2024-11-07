var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

// 'This is local' because the local variable inside `someFunction()` will be logged on line 5
