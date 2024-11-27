function staggeredCase(string) {
  let upper = true;

  return [...string].map((char) => {
    if (/[a-z]/i.test(char)) {
      if (upper === true) {
        upper = false;
        return char.toUpperCase();
      } else if (upper === false) {
        upper = true;
        return char.toLowerCase();
      }
    }
    return char;
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"
