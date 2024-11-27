// function letterCaseCount(string) {
//   let object = {};

//   let lowercase = string.match(/[a-z]/g);
//   let uppercase = string.match(/[A-Z]/g);
//   let neither = string.match(/[^a-z]/gi);

//   object.lowercase = lowercase ? lowercase.length : 0;
//   object.uppercase = uppercase ? uppercase.length : 0;
//   object.neither = neither ? neither.length : 0;

//   return object;
// }

function letterCaseCount(string) {
  return {
    lowercase: (string.match(/[a-z]/g) || []).length,
    uppercase: (string.match(/[A-Z]/g) || []).length,
    neither: (string.match(/[^a-z]/gi) || []).length,
  };
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
