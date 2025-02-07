let header = document.querySelector('body > header');
let main = document.querySelector('main');
document.body.insertBefore(header, main);

let h1 = document.querySelector('main > h1');
header.insertAdjacentElement('afterbegin', h1);

let figureTwo = document.querySelectorAll('figure')[0];
let figureOne = document.querySelectorAll('figure')[1];

document.querySelector('p').insertAdjacentElement('afterend', figureOne);
figureOne.insertAdjacentElement('afterend', figureTwo);
