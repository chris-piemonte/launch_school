function logInBox(string) {
  const MAXIMUM_BOX_WIDTH = 25;
  const MAXIMUM_STRING_WIDTH = MAXIMUM_BOX_WIDTH - 4;

  let stringLength = string.length;
  let rowsOfString = Math.ceil(stringLength / MAXIMUM_STRING_WIDTH);
  let topAndBottomRow = `+-${'-'.repeat(MAXIMUM_STRING_WIDTH)}-+`;
  let emptyRow = `| ${' '.repeat(MAXIMUM_STRING_WIDTH)} |`;

  let messageLines = []
  for (let i = 0; i <= stringLength; i += MAXIMUM_STRING_WIDTH) {
    messageLines.push(string.substring(i, i + MAXIMUM_STRING_WIDTH));
  }

  console.log(topAndBottomRow);
  console.log(emptyRow);

  for (let i = 1; i <= rowsOfString; i += 1) {
    let endSpaces = MAXIMUM_STRING_WIDTH - messageLines[0].length + 1;
    let messageRow = `| ${messageLines.shift()}${' '.repeat(endSpaces)}|`;
    console.log(messageRow);
  }

  console.log(emptyRow);
  console.log(topAndBottomRow);
}

logInBox('To boldly go where no one has gone before.');
logInBox('');
