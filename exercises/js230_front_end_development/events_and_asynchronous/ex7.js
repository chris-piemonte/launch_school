function removeHighlight() {
  const highlighted = document.querySelector('.highlight');
  if (highlighted) {
    highlighted.classList.remove('highlight')
  }
}

function highlight(event) {
  event.stopPropagation();
  let target = event.target;
  removeHighlight();

  let element;
  let id;
  if (target.tagName === 'A') {
    id = target.href.match('#article-[0-9]+')[0];
    element = document.querySelector(id);
  } else {
    element = document.querySelector('main');
  }

  element.classList.add('highlight');
}

const nav = document.querySelector('ul');
const main = document.querySelector('main');

nav.addEventListener('click', highlight);
document.addEventListener('click', highlight);

main.addEventListener('click', event => {
  event.preventDefault();
  let article = event.target;
  if (article.tagName !== 'ARTICLE') article = article.parentNode;
  if (article.tagName === 'ARTICLE') {
    event.stopPropagation();
    removeHighlight();
    article.classList.add("highlight");
  }
});
