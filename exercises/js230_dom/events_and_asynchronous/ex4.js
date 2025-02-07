<a href="https://www.launchschool.com">
  Home
  <img src="https://d24f1whwu8r3u4.cloudfront.net/assets/launch-logo-b6d01bd15ee9da31457ee3c315845718823aa8a741858be598ab35042a312348.svg" />
</a>

document.querySelector('img').addEventListener('click', event => {
  event.stopPropagation();
}, false);

// It doesn't stop the link from GET'ing because event.stopPropogation() prevents subsequent listeners from firing but doesn't prevent the default behavior. Need to use event.preventDefault().

document.querySelector('img').addEventListener('click', event => {
  event.preventDefault();
}, false);
