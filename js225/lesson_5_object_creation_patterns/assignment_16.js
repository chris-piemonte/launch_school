// Problem 1-4

// class Cat {
//   constructor(name = 'Kitty') {
//     this.name = name;
//   }

//   static genericGreeting() {
//     console.log("Hello! I'm a cat!");
//   }

//   greet() {
//     console.log(`Hello! My name is ${this.name}!`);
//   }

//   rename(newName) {
//     this.name = newName
//   }
// }

// let kitty = new Cat();
// let sophie = new Cat('Sophie');

// sophie.greet();
// sophie.rename('Greg');
// sophie.greet();
// Cat.genericGreeting();

// Problem 5-6

// class Rectangle {
//   constructor(width, length) {
//     this.width = width;
//     this.length = length;
//   }

//   getWidth() {
//     return this.width;
//   }

//   getLength() {
//     return this.length;
//   }

//   getArea() {
//     return this.width * this.length;
//   }
// }

// class Square extends Rectangle {
//   constructor(side) {
//     super(side, side);
//   }
// }

// let square = new Square(5);
// console.log(`area of square = ${square.getArea()}`); // area of square = 25

// Problem 7

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//   speaks() {
//     return `${this.name} says meowwww.`;
//   }
// }

// let fakeCat = Object.create(Cat.prototype);
// console.log(fakeCat instanceof Cat); // logs true
// console.log(fakeCat.hasOwnProperty('name')); // logs false
// console.log(fakeCat.speaks()); // logs undefined says meowwww.

// Problem 8

// class Pet {
//   constructor(name, age) {
//     this.name = name;
//     this.age = age;
//   }
// }

// class Cat extends Pet {
//   constructor(name, age, color) {
//     super(name, age);
//     this.color = color;
//   }

//   info() {
//     return `My cat ${this.name} is ${this.age} years old and has ${this.color} fur.`
//   }
// }

// let pudding = new Cat('Pudding', 7, 'black and white');
// let butterscotch = new Cat('Butterscotch', 10, 'tan and white');

// console.log(pudding.info());
// console.log(butterscotch.info());

// Problem 9

// class Animal {
//   constructor(name, age, legs, species, status) {
//     this.name = name;
//     this.age = age;
//     this.legs = legs;
//     this.species = species;
//     this.status = status;
//   }
//   introduce() {
//     return `Hello, my name is ${this.name} and I am ${this.age} years old and ${this.status}.`;
//   }
// }

// class Cat extends Animal {
//   constructor(name, age, status) {
//     super(name, age, 4, 'cat', status);
//   }

//   introduce() {
//     return super.introduce() + ' Meow meow!';
//   }
// }

// class Dog extends Animal {
//   constructor(name, age, status, master) {
//     super(name, age, 4, 'dog', status);
//     this.master = master;
//   }

//   greetMaster() {
//     return `Hello ${this.master}! Woof, woof!`;
//   }
// }

// let cat = new Cat("Pepe", 2, "happy");
// console.log(cat.introduce());

// let dog = new Dog("Casper", 5, "happy", 'Chris');
// console.log(dog.introduce());
// console.log(dog.greetMaster());

// Problem 10

// class Vehicle {
//   constructor(make, model, wheels) {
//     this.make = make;
//     this.model = model;
//     this.wheels = wheels;
//   }

//   getWheels() {
//     return this.getWheels;
//   }

//   info() {
//     return `${this.make} ${this.model}`;
//   }
// }

// class Car extends Vehicle {
//   constructor(make, model) {
//     super(make, model, 4);
//   }
// }

// class Motorcycle {
//   constructor(make, model) {
//     super(make, model, 2);
//   }
// }

// class Truck {
//   constructor(make, model, payload) {
//     super(make, model, 6);
//     this.payload = payload;
//   }
// }

// Problem 12

// class Person {
//   constructor(name) {
//     this.name = name;
//   }

//   greeting() {
//     return `Hello, I'm ${this.name}. It's very nice to meet you.`;
//   }
// }

// class Shouter extends Person {
//   greeting() {
//     return super.greeting().toUpperCase();
//   }
// }

// let person = new Person("Jane");
// let shouter = new Shouter("Bob");

// console.log(person.greeting()); // Hello, I'm Jane. It's very nice to meet you.
// console.log(shouter.greeting()); // HELLO, I'M BOB. IT'S VERY NICE TO MEET YOU.

// Problem 13

// class Pet {
//   constructor(species, name) {
//     this.species = species;
//     this.name = name;
//   }
// }

// class Owner {
//   constructor(name) {
//     this.name = name;
//     this.pets = [];
//   }

//   addPet(pet) {
//     this.pets.push(pet);
//   }

//   numberOfPets() {
//     return this.pets.length;
//   }

//   printPets() {
//     this.pets.forEach(pet => {
//     console.log(`a ${pet.species} named ${pet.name}`);
//     });
//   }
// }

// class Shelter {
//   constructor() {
//     this.owners = {};
//   }

//   adopt(owner, pet) {
//     owner.addPet(pet);

//     if (!this.owners[owner.name]) {
//       this.owners[owner.name] = owner;
//     }
//   }

//   printAdoptions() {
//     for (let name in this.owners) {
//       console.log(`${name} has adopted the following pets:`);
//       this.owners[name].printPets();
//       console.log();
//     }
//   }
// }

// let butterscotch = new Pet('cat', 'Butterscotch');
// let pudding      = new Pet('cat', 'Pudding');
// let darwin       = new Pet('bearded dragon', 'Darwin');
// let kennedy      = new Pet('dog', 'Kennedy');
// let sweetie      = new Pet('parakeet', 'Sweetie Pie');
// let molly        = new Pet('dog', 'Molly');
// let chester      = new Pet('fish', 'Chester');

// let phanson = new Owner('P Hanson');
// let bholmes = new Owner('B Holmes');

// let shelter = new Shelter();
// shelter.adopt(phanson, butterscotch);
// shelter.adopt(phanson, pudding);
// shelter.adopt(phanson, darwin);
// shelter.adopt(bholmes, kennedy);
// shelter.adopt(bholmes, sweetie);
// shelter.adopt(bholmes, molly);
// shelter.adopt(bholmes, chester);
// shelter.printAdoptions();
// console.log(`${phanson.name} has ${phanson.numberOfPets()} adopted pets.`);
// console.log(`${bholmes.name} has ${bholmes.numberOfPets()} adopted pets.`);

// Problem 14

class Banner {
  constructor(message) {
    this.message = message;
    this.length = message.length + 2;
  }

  displayBanner() {
    console.log([this.horizontalRule(), this.emptyLine(), this.messageLine(), this.emptyLine(), this.horizontalRule()].join("\n"));
  }

  horizontalRule() {
    return '+' + '-'.repeat(this.length) + '+';
  }

  emptyLine() {
    return '|' + ' '.repeat(this.length) + '|';
  }

  messageLine() {
    return `| ${this.message} |`
  }
}

let banner1 = new Banner('To boldly go where no one has gone before.');
banner1.displayBanner();

let banner2 = new Banner('');
banner2.displayBanner();
