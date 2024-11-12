function triangle(num) {
  for (let spaces = num - 1; spaces >= 0; spaces -= 1) {
    console.log(`${' '.repeat(spaces)}${'*'.repeat(num - spaces)}`);
  }
}

triangle(5);
triangle(9);
