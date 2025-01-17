// Problem 1 & 2

// (function() {
//   console.log("Sometimes, syntax isn't intuitive!")
// })();

// Problem 3

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
}

sum += (function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);  // ?

// Problem 4

function countdown(count) {
  (function(num) {
    while (num >= 0) {
      console.log(num);
      num -= 1;
    }
    console.log('Done!');
  })(count);
}

// countdown(7);

// Problem 6

function countdown(count) {
  (function recursion(num) {
    console.log(num);

    if (num === 0) {
      console.log('Done!')
    } else {
      recursion(num - 1);
    }
  })(count);
}

countdown(7);
