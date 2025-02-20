function wrapInArray(arg: string | number): (string | number)[] {
  return [arg];
}

let a = wrapInArray('hello');
let b = wrapInArray(100);

console.log(a, b);
