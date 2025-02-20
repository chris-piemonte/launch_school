document.addEventListener('DOMContentLoaded', () => {
  const item = document.querySelector('#name');
  const quantity = document.querySelector('#quantity');
  const list = document.querySelector('#grocery-list');
  const form = document.querySelector('form')

  form.addEventListener('submit', (event) => {
    event.preventDefault();

    const newNode = document.createElement('li');
    if (!quantity.value) quantity.value = 1;
    newNode.textContent = quantity.value + ' ' + item.value;
    list.appendChild(newNode);

    form.reset();
  });
});
