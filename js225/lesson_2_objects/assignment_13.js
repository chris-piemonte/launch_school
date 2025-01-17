function createProduct(id, name, stock, price) {
  return {
    id,
    name,
    stock,
    price,

    setPrice(price) {
      if (price <= 0) return console.log('Invalid price, price must by greater than $0.00.');

      this.price = price;
    },

    describe() {
      console.log(`Name: ${this.name}\nID: ${this.id}\nPrice: $${this.price}\nStock: ${this.stock}`);
    },
  };
}

let scissors = createProduct(0, 'Scissors', 8, 10);
let drill = createProduct(1, 'Cordless Drill', 15, 45);

scissors.describe();
drill.describe();
