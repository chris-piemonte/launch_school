function substr(string, start, length) {
  let substring = '';
  if (start < 0) start = string.length + start;

  for (let i = start; i < start + length && i < string.length; i += 1) {
    substring += string[i];
  }

  return console.log(substring);
}

let string = 'hello world';

substr(string, 2, 4);      // "llo "
substr(string, -3, 2);     // "rl"
substr(string, 8, 20);     // "rld"
substr(string, 0, -20);    // ""
substr(string, 0, 0);      // ""
