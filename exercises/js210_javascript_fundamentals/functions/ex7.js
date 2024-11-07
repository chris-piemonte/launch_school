let a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);

// it will return undefined on line 7 because a function that has no explicit return implicitly returns undefined, the it will
// log 7 to the console on line 8 becaues a on line 1 is a primitive value and thus is not affected by the local variable a in myValue()
