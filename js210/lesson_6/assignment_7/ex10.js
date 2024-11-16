function test(one, two, three, four, five) {
  return {
    one,
    five,
    middle: [two, three, four].sort(),
  };
}

let arr = [1, 2, 3, 4, 5];
let { one, five, middle } = test(...arr);
