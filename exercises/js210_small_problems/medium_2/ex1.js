function letterPercentages(string) {
  const chars = {lowercase: 0, uppercase: 0, neither: 0};

  [...string].forEach(char => {
    if (/[a-z]/.test(char)) {
      chars.lowercase += 1;
    } else if (/[A-Z]/.test(char)) {
      chars.uppercase += 1;
    } else {
      chars.neither += 1;
    }
  });

  for (let type in chars) {
    chars[type] = (chars[type] / string.length * 100).toFixed(2);
  }

  return chars;
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
