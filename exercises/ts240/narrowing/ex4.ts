type Circle = {
  kind: 'circle',
  radius: number,
}

type Square = {
  kind: 'square',
  sideLength: number,
}

type Shape = Circle | Square;

function getArea(shape: Shape): number {
  if (shape.kind === 'circle') {
    return shape.radius**2 * Math.PI;
  } else {
    return shape.sideLength**2;
  }
}

let f: Circle = {kind: 'circle', radius: 10};
let g: Square = {kind: 'square', sideLength: 10};

console.log(getArea(f));
console.log(getArea(g));

console.log(getArea({ kind: "circle", radius: 10 }));
console.log(getArea({ kind: "square", sideLength: 10 }));
