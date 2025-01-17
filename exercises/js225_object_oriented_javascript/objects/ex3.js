function objectsEqual(a, b) {
  if (Object.keys(a).every(key => {
    if (typeof a[key] === 'object') {
      return objectsEqual(a[key], b[key]);
    }

    return a[key] === b[key];
  }) === false) return false;

  return Object.keys(b).every(key => {
    if (typeof b[key] === 'object') {
      return objectsEqual(b[key], a[key]);
    }

    return b[key] === a[key];
  })
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({a: 'foo', b: 'bar'}, {b: "bar", a: 'foo'}));  // true
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false

console.log(objectsEqual({a: 'foo', b: {c: 'test'}}, {a: 'foo', b: {c: 'test'}}));  // true
console.log(objectsEqual({a: 'foo', b: {c: 'test', d: true}}, {a: 'foo', b: {c: 'test', d: false}}));  // false
