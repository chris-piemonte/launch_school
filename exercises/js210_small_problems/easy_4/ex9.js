function countOccurrences(array) {
  const object = {};

  array.forEach(vehicle => {
    object[vehicle] = (object[vehicle] ? object[vehicle] + 1 : 1);
  });

  for (let vehicle in object) {
    console.log(`${vehicle} => ${object[vehicle]}`);
  }
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
// suv => 1
