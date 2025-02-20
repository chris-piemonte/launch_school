function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const user = {
  name: 'Chris',
  age: 31,
}

console.log(getProperty(user, 'name'));
