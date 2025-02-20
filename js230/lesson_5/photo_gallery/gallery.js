document.addEventListener('DOMContentLoaded', () => {
  const mainImage = document.querySelector('figure img');
  const navigation = document.querySelectorAll('li img');

  function displayImage(event) {
    let image = event.target.closest('img');
    mainImage.src = image.src;
    navigation.forEach(image => image.style.borderColor = 'white');
    image.style.borderColor = 'blue';
  }

  navigation.forEach(image => image.addEventListener('click', displayImage));
});
