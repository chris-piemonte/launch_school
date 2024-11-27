function totalArea(array) {
  return array.map(sides => sides[0] * sides[1]).reduce((total, area) => total + area);
}

function totalSquareArea(array) {
  return totalArea(array.filter(([height, width]) => height === width));
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141

rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles));    // 121
