function makeCountry(name, continent, visited=false) {
  return {
    name,
    continent,
    visited,

    getDescription() {
      return this.name + ' is located in ' + this.continent + '. I ' + (this.visited ? 'have ' : "haven't ") + 'visited ' + this.name;
    },

    visitCountry() {
      this.visited = true;
    },
  };
}

let chile = makeCountry('The Republic of Chile', 'South America');
let canada = makeCountry('Canada', 'North America');
let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

console.log(chile.getDescription());
console.log(canada.getDescription());
console.log(southAfrica.getDescription());
