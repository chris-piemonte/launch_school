interface keyValuePair<Key, Value> {
  key: Key,
  value: Value,
}

const example: keyValuePair<string, number> = {
  key: "gold",
  value: 500,
}
