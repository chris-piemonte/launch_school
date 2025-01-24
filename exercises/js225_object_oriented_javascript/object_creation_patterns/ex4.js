const ItemCreator = (() => {
  function checkItemName(itemName) {
    itemName = itemName.replace(/\s/g, '');
    return itemName.length >= 5;
  }

  function checkCategory(category) {
    return (!category.includes(' ') && category.length >= 5);
  }

  function checkQuantity(quantity) {
    return quantity !== undefined;
  }

  function createSKU(itemName, category) {
    let string = itemName.replace(/\s/g, '').slice(0, 3) + category.slice(0, 2);
    this.sku = string.toUpperCase();
  }

  return (itemName, category, quantity) => {
    let obj = {};

    if (checkItemName(itemName) && checkCategory(category) && checkQuantity(quantity)) {
      obj.itemName = itemName;
      obj.category = category;
      obj.quantity = quantity;
      createSKU.call(obj, itemName, category);
      return obj;
    } else {
      return {notValid: true };
    }
  };
})();

const ItemManager = {
  items: {},

  create(itemName, category, quantity) {
    const obj = ItemCreator(itemName, category, quantity);

    if (obj.notValid) {
      return false
    } else {
      this.items[obj.sku] = obj;
    }
  },

  update(sku, info) {
    // for (let prop in info) {
    //   this.items[sku][prop] = info[prop];
    // }

    Object.assign(this.items[sku], info);
  },

  delete(sku) {
    delete this.items[sku];
  },

  list() {
    return this.items;
  },

  inStock() {
    // return Object.values(this.items).filter(item => item.quantity > 0);
    return Object.values(this.items).filter(({quantity}) => quantity > 0);
  },

  itemsInCategory(category) {
    return Object.values(this.items).filter(item => item.category === category);
  },
}

const ReportManager = {
  init(ItemManager) {
    this.items = ItemManager;
  },

  createReporter(sku) {
    let obj = this.items.items[sku];

    return {
      itemInfo() {
        for (let prop in obj) {
          console.log(`${prop}: ${obj[prop]}`);
        }
      }
    }
  },

  reportInStock() {
    let string = this.items.inStock().reduce((string, item) => {
      return string + ',' + item.itemName;
    }, '');

    console.log(string.slice(1));
  },
}

ItemManager.create('basket ball', 'sports', 0);           // valid item
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

console.log(ItemManager.items);
// returns list with the 4 valid items

ReportManager.init(ItemManager);
ReportManager.reportInStock();
// logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
console.log(ItemManager.inStock());
// returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// logs football,kitchen pot
console.log(ItemManager.itemsInCategory('sports'));
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
console.log(ItemManager.items);
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10
