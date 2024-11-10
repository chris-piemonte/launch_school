function toLowerCase(string) {
  let newString = ''

  for (let i = 0; i < string.length; i += 1) {
    if (/[A-Z]/.test(string[i])) {
      newString += String.fromCharCode(string.charCodeAt(i) + 32);
    } else {
      newString += string[i]
    }
  }

  return console.log(newString);
}

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"
