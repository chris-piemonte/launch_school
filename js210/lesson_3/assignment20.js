function substring(string, start, end) {
  if (isNaN(start) || start === undefined) {
    start = 0;
  } else if (start > string.length) {
    start = string.length
  }

  if (end === undefined || end > string.length) {
    end = string.length;
  } else if (isNaN(end) || end < 0) {
    end = 0;
  }

  if (start === end) return console.log('');
  if (start > end) [start, end] = [end, start];

  let answer = ''
  for (; start < end; start += 1) {
    answer += string[start];
  }

  return console.log(answer);
}

let string = 'hello world';

substring(string, 2, 4);    // "ll"
substring(string, 4, 2);    // "ll"
substring(string, 0, -1);   // ""
substring(string, 2);       // "llo world"
substring(string, 'a');     // "hello world"
substring(string, 8, 20);   // "rld"
