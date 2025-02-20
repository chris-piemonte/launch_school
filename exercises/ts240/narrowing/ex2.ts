function isStringArray(arr: unknown[]): arr is string[] {
  return arr.every(ele => typeof ele === 'string');
}

isStringArray([1, 2, 3])
