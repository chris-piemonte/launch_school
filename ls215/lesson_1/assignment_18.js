function anagram(word, list) {
  word = word.split('').sort().join('');
  return list.filter(ele => word === ele.split('').sort().join(''));
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
