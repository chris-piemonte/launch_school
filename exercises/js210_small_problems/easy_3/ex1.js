function age(min, max) {
  if (min > max) [min, max] = [max, min];
  console.log(`Teddy is ${(Math.floor(Math.random() * (200 - 20 + 1) + 20))} years old!`)
}

age(200, 20);
