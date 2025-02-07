function makeBold(element, callback) {
  element.style.fontWeight = 'bold';

  callback(element);
}

let sectionElement = document.querySelector('section');
makeBold(sectionElement, function(elem) {
  elem.classList.add('highlight');
});

sectionElement.classList.contains('highlight');
// true
sectionElement.style.fontWeight;
// "bold"
