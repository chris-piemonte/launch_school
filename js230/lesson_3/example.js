document.addEventListener("DOMContentLoaded", () => {
  let store = document.getElementById("store");

  let request = new XMLHttpRequest();
  request.open("GET", "https://ls-230-web-store-demo.herokuapp.com/products");

  request.addEventListener("load", () => store.innerHTML = request.response);
  request.send();

  store.addEventListener("click", event => {
    let target = event.target;
    if (target.tagName !== "A") {
      return;
    }

    event.preventDefault();

    let request = new XMLHttpRequest();
    request.open(
      "GET",
      "https://ls-230-web-store-demo.herokuapp.com" + target.getAttribute("href")
    );

    request.addEventListener("load", event => (store.innerHTML = request.response));
    request.send();
  });

  store.addEventListener("submit", event => {
    event.preventDefault();

    let form = event.target;
    let request = new XMLHttpRequest();
    let data = new FormData(form);

    request.open('POST', `https://ls-230-web-store-demo.herokuapp.com/${form.getAttribute('action')}`);
    request.setRequestHeader("Authorization", "token AUTH_TOKEN");

    request.addEventListener('load', event => store.innerHTML = request.response);
    request.send(data);
  });
});

function createProduct(data) {
  let request = new XMLHttpRequest();

  request.open('POST', "https://ls-230-web-store-demo.herokuapp.com/v1/products");
  request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
  request.setRequestHeader('Authorization', 'token AUTH_TOKEN');

  request.addEventListener('load', () => {
    console.log(`This product was added: ${request.responseText}`);
  });

  let json = JSON.stringify(data);
  request.send(json);
}

createProduct({name: 'muffin man', sku: 'P2MM', price: 299});
