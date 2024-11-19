function swapName(name) {
  return name.split(' ').reverse().join(', ');
}

console.log(swapName('Joe Roberts'));    // "Roberts, Joe"

function swapName(name) {
  let array = name.split(' ');
  array.unshift(array.pop() + ',');
  return array.join(' ');
}

console.log(swapName('Joe Jacobs Roberts'));    // "Roberts, Joe"
