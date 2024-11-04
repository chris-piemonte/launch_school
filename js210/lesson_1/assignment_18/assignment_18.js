let apples = 3;
let bananas = 1;
let areEqual = (apples === bananas);
let eitherOr = (bananas || apples);

if (apples === bananas) {
  console.log('true');
} else {
  if (apples == bananas) {
    console.log('same numbers, different types');
  } else {
  console.log('false');
  }
}

console.log(areEqual);
console.log(eitherOr);

let lastName = 'gawgaw';
let familyMessage = lastName === 'Piemonte' ? "You're part of the family!" : "You're not family.";
console.log(familyMessage);
