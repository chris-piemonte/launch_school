// for (let i = 1; i <= 99; i+=2) console.log(i);

function oddNumbers(min, max) {
  if (min % 2 === 0) min += 1;
  for (let i = min; i<= max; i+=2) console.log(i);
}

oddNumbers(18, 51);
