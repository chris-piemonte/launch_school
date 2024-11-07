function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

// Since there is no variable declaration for myVar on line 2, JavaScript looks in the outer global scope for the declaration.
// Since it doesn't exist there, myVar is bound aas a property of the global object and accessed on line 6.
