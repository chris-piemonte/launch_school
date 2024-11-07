var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

// It will log 'This is hloobal' becase myVar() from line 1 is in the closure of someFunction()
