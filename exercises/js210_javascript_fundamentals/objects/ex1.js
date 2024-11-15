const myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
myObject[a];
myObject.a;

// myObject[a] raises a ReferenceError because the operand inside bracket notation must be a string value, and JavaScript is reading [a] as an undeclared variable
