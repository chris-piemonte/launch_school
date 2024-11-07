let a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

//7 because the variable b in the myValue function is a loal variable and doens't affect a from line 1; it acts as pass by value
