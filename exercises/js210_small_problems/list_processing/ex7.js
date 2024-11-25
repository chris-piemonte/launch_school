function leadingSubstrings(string) {
  return string.split('').map((_, ind) => string.slice(0, ind + 1));
}

function substrings(string) {
  return [...string].flatMap((_, ind) => leadingSubstrings(string.slice(ind)));
}

function palindromes(string) {
  return substrings(string).filter(substr => {
    return (substr.length > 1) && (substr === [...substr].reverse().join(''));
  });
}

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
/* returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]
*/

console.log(palindromes('knitting cassettes'));
/* returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
*/
