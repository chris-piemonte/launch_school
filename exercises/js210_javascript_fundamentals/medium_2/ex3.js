let startingBalance = 1;
const chicken = 5;
const chickenQuantity = 7;

function totalPayable(item, quantity) {
  return startingBalance + (item * quantity);
}

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity));

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));

// it logs 40 then 45 because startingBalance is reassigned on lines 9 & 12 and because of lexical scope the variable declared on line 1 is accessable from the function call on line 6. The function retains access to the variable declared in its outer scope, so startingBalance on line 6 is not a reference to 1 it is a reference to the value stored in the variable in the global scope at the time the function is called.
