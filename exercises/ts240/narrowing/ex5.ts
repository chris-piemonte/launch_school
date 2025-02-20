type Circle = {
  kind: 'circle',
  radius: number,
}

type Square = {
  kind: 'square',
  sideLength: number,
}

type Shape = Circle | Square;

function assertNever(value: never): never {
  throw new Error(`Inproper input: ${value}`);
}

function getArea(shape: Shape): number {
  switch (shape.kind) {
    case 'circle':
      return Math.PI * shape.radius ** 2;
    case 'square':
      return shape.sideLength * shape.sideLength;
    default:
      return assertNever(shape);
  }
}

let f: Circle = {kind: 'circle', radius: 10};
let g: Square = {kind: 'square', sideLength: 10};

console.log(getArea(f));
console.log(getArea(g));

console.log(getArea({ kind: "circle", radius: 10 }));
console.log(getArea({ kind: "square", sideLength: 10 }));

getArea(42);
