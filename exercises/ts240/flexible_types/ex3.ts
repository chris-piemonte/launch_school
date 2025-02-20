function firstElement<T>(arr: T[]): T | undefined {
  return arr[0];
}

let c = firstElement([7, 9, 11]);
let d = firstElement([]);

console.log(c, d);
