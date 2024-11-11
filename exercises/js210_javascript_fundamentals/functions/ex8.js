let a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a);
console.log(a);

// It will log [1, 2, 10] because a is pointing to an array objec, so a reference ot the array is passed into myValue()
// and the array is mutated inside the function. on line 8 the variable a is still pointing to the same array reference.
