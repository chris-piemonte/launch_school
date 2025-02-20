interface StringMap {
  [key: string]: string;
}

const dictionary: StringMap = {
  a: '1',
  b: '2',
  c: '3'
  };
console.log(dictionary);

const recordExample: Record<string, string> = {
  hello: 'test',
  goodbye: 'test2'
}
