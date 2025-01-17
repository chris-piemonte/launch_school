function makeList() {
  let items = [];

  return {
    add(item) {
      items.push(item);
      console.log(`${item} added!`);
    },

    remove(item) {
      items.splice(items.indexOf(item), 1);
      console.log(`${item} removed!`);
    },

    list() {
      items.forEach(item => console.log(item));
    },
  }
}


let list = makeList();
list.add('peas');
list.list();
list.add('corn');
list.list();
list.remove('peas');
list.list();

console.log(list.items);
