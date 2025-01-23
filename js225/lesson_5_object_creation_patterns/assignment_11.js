// Problem 1

// let a = 1;
// let foo;
// let obj;

// function Foo() {
//   this.a = 2;
//   this.bar = function() {
//     console.log(this.a);
//   };
//   this.bar();
// }

// foo = new Foo(); // 2

// foo.bar(); // 2
// Foo(); // 2

// obj = {};
// Foo.call(obj); // 2
// obj.bar(); // 2

// console.log(this.a); // 2/undefined for Node

// Problem 2

// let RECTANGLE = {
//   area() {
//     return this.width * this.height;
//   },
//   perimeter() {
//     return 2 * (this.width + this.height);
//   },
// };

// function Rectangle(width, height) {
//   this.width = width; // 2
//   this.height = height; // 3
//   this.area = RECTANGLE.area(); // NaN
//   this.perimeter = RECTANGLE.perimeter(); // NaN
// }

// let rect1 = new Rectangle(2, 3);
// console.log(rect1.area); // NaN
// console.log(rect1.perimeter); // NaN

// function Rectangle(width, height) {
//   this.width = width; // 2
//   this.height = height; // 3
//   this.area = RECTANGLE.area.call(this); // 6
//   this.perimeter = RECTANGLE.perimeter.call(this); // 10
// }

// Problem 3

// function Circle(radius) {
//   this.radius = radius;
// }

// Circle.prototype.area = function() {
//   return Math.PI * this.radius**2;
// }

// let a = new Circle(3);
// let b = new Circle(4);

// console.log(a.area().toFixed(2)); // => 28.27
// console.log(b.area().toFixed(2)); // => 50.27

// Problem 4

// let ninja;
// function Ninja() {
//   this.swung = true;
// }

// ninja = new Ninja();

// Ninja.prototype.swingSword = function() {
//   return this.swung;
// };

// console.log(ninja.swingSword()); // true

// Problem 5

// let ninja;
// function Ninja() {
//   this.swung = true;
// }

// ninja = new Ninja();

// Ninja.prototype = {
//   swingSword: function() {
//     return this.swung;
//   },
// };

// console.log(ninja.swingSword()); // TypeError: ninja.swingSword is not a function

// Problem 6

// let ninjaA;
// let ninjaB;
// function Ninja() {
//   this.swung = false;
// }

// ninjaA = new Ninja();
// ninjaB = new Ninja();

// // Add a swing method to the Ninja prototype which
// // returns the calling object and modifies swung
// Ninja.prototype.swing = function() {
//   this.swung = true;
//   return this;
// };

// console.log(ninjaA.swing().swung);      // must log true
// console.log(ninjaB.swing().swung);      // must log true

// Problem 7

let ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object
// let ninjaB = Object.create(Object.getPrototypeOf(ninjaA));

let ninjaB = new ninjaA.constructor;

console.log(ninjaB.constructor === ninjaA.constructor);    // should log true
