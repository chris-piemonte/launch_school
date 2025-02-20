function printId(value: (number | string)): void {
  if (typeof value === 'number') {
    console.log('Your ID is a number');
  } else {
    console.log('Your ID is a string');
  }
}

printId(101);
printId('202');
