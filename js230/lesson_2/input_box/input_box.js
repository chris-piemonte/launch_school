document.addEventListener('DOMContentLoaded', () => {
  let textField = document.querySelector('.text-field');
  let content = document.querySelector('.content');
  let cursor;

  textField.addEventListener('click', event => {
    event.stopPropagation();
    textField.classList.add('focused');

    if (!cursor) {
      cursor = setInterval(() => {
        textField.classList.toggle('cursor');
      }, 500);
    }
  });

  document.addEventListener('click', () => {
    clearInterval(cursor);
    cursor = null;
    if (textField.classList.contains('focused')) {
      textField.classList.remove('focused');
      textField.classList.remove('cursor');
    }
  });

  document.addEventListener('keydown', event => {
    if (textField.classList.contains('focused')) {
      if (event.key === 'Backspace') {
        content.textContent = content.textContent.slice(0, content.textContent.length - 1);
      } else if (event.key.length === 1) {
        content.textContent += event.key;
      }
    }
  });
});
