function printLength(value: string | string[]): void {
  if (typeof value === 'string') {
    console.log(`String length: ${value.length}`);
  } else {
    console.log(`Array count: ${value.length}`);
  }
}

printLength("hello");
printLength(["hello", "world"]);
