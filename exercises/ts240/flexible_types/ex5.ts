function filterByType<T>(arr: any[], type: string): T[] {
  return arr.filter(ele => typeof ele === type);
}

let e = filterByType<string>(["hello", "world", 42, true], "string");
console.log(e);
