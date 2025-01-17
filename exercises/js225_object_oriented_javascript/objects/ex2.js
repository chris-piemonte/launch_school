const item = {
  name: 'Foo',
  description: 'Fusce consequat dui est, semper.',
  price: 50,
  quantity: 100,
  discount(percent) {
    const discount = this.price * percent / 100;
    this.price -= discount;

    return this.price;
  },
};

console.log(item.discount(20));   // should return 40
console.log(item.discount(50));   // should return 25
console.log(item.discount(25));   // should return 37.5

// The discount function mutates the item objet by reassigning the price property in the item object so the price isn't reset to 50 between every function call

const item = {
  name: 'Foo',
  description: 'Fusce consequat dui est, semper.',
  price: 50,
  quantity: 100,
  discount(percent) {
    const discount = this.price * percent / 100;
    let newPrice = this.price - discount;

    return newPrice;
  },
};
