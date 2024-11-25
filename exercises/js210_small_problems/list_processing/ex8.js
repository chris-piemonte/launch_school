function buyFruit(array) {
  return array.flatMap(subarr => {
    let longform = [];
    for (i = 1; i <= subarr[1]; i += 1) {
      longform.push(subarr[0]);
    }
    return longform;
  });
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
