function reverseWords(string) {
  let words = string.split(' ');

  for (let i = 0; i < words.length; i += 1) {
    let word = [...words[i]]
    let start = 0;
    let end = word.length - 1;
    while (start < end) {
      [word[start], word[end]] = [word[end], word[start]];
      start += 1;
      end -= 1;
    }
    words[i] = word.join('');
  }

  return words.join(' ');
}

console.log(reverseWords("Hello World") === "olleH dlroW");
console.log(reverseWords("JavaScript is fun") === "tpircSavaJ si nuf");
console.log(reverseWords("Coding in the sun") === "gnidoC ni eht nus");
console.log(reverseWords("Launch School") === "hcnuaL loohcS");
