function isPalindrome(string) {
  string = string.split('');
  let stringReversed = string.slice().reverse();

  for (let i in string) {
    if (string[i] !== stringReversed[i]) {
      return false;
    }
  }

  return true;
}

console.log(isPalindrome('madam'));               // true
console.log(isPalindrome('Madam'));               // false (case matters)
console.log(isPalindrome("madam i'm adam"));      // false (all characters matter)
console.log(isPalindrome('356653'));              // true
