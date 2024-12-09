function featured(num) {
  const MAX_NUM = 9876543201;

  while (num <= MAX_NUM) {
    num += 1;
    if (num % 7 === 0) {
      while (num <= MAX_NUM) {
        if (num % 2 === 1 && unique(String(num))) {
          return num;
        }
        num += 7;
      }
    }
  }
  return "There is no possible number that fulfills those requirements.";
}

function unique(string) {
  for (let i = 0; i < string.length; i += 1) {
    let regex = new RegExp(string[i], 'g')
    if (string.match(regex).length > 1) return false;
  }

  return true;
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."
