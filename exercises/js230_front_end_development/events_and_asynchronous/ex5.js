const main = document.querySelector('main');
const sub = document.querySelector('#sub');

main.addEventListener('contextmenu', event => {
  event.preventDefault();
  alert(main.tagName);
});

sub.addEventListener('contextmenu', event => {
  event.preventDefault();
  event.stopPropagation();
  alert(sub.tagName);
});
