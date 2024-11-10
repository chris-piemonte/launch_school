function logMultiples(num) {
  for (let mult = Math.floor(100 / num) * num; mult >= num; mult -= num) {
    if (mult % 2 !== 0) {
      console.log(mult);
    }
  }
}


logMultiples(17);
logMultiples(21);
