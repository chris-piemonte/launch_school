function incrementProperty(object, string) {
  if (Object.keys(object).includes(string)) {
    return object[string] +=1;
  } else {
    return object[string] = 1;
  }
}

let wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie'));   // 5
console.log(wins);                               // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));    // 1
console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }
