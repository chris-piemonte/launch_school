document.addEventListener('DOMContentLoaded', () => {
  const firstNumber = document.querySelector('#first-number');
  const secondNumber = document.querySelector('#second-number');
  const operator = document.querySelector('#operator');
  const result = document.querySelector('#result');
  const form = document.querySelector('form');

  form.addEventListener('submit', (event) => {
    event.preventDefault();

    switch (operator.value) {
      case '+':
        result.textContent = Number(firstNumber.value) + Number(secondNumber.value);
        break;
      case '-':
        result.textContent = Number(firstNumber.value) - Number(secondNumber.value);
        break;
      case '*':
        result.textContent = Number(firstNumber.value) * Number(secondNumber.value);
        break;
      case '/':
        result.textContent = Number(firstNumber.value) / Number(secondNumber.value);
        break;
    }
  });
});
