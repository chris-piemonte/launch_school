const classifications = document.querySelector('#animal-classifications');
const animals = document.querySelector('#animals');
const linkedOptions = {
  classifications: {
    Vertebrate: ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
    'Warm-blooded': ['Bear', 'Whale', 'Ostrich'],
    'Cold-blooded': ['Salmon', 'Turtle'],
    Mammal: ['Bear', 'Whale'],
    Bird: ['Ostrich'],
    Classifications: ['Animals', 'Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
  },
  animals: {
    Bear: ['Vertebrate', 'Warm-blooded', 'Mammal'],
    Turtle: ['Vertebrate', 'Cold-blooded'],
    Whale: ['Vertebrate', 'Warm-blooded', 'Mammal'],
    Salmon: ['Vertebrate', 'Cold-blooded'],
    Ostrich: ['Vertebrate', 'Warm-blooded', 'Bird'],
    Animals: ['Classifications', 'Vertebrate', 'Warm-blooded', 'Cold-blooded', 'Mammal', 'Bird'],
  },
};
const clearFilters = document.querySelector('#clear');
let classificationsValue;
let animalsValue;

function setOptions({options}, filters) {
  options.length = 0;
  filters.forEach((value, index) => {
    options[index] = new Option(value);
  });
}

function setDefault(event) {
  event.preventDefault();
  setOptions(classifications, ['Classifications', 'Vertebrate', 'Warm-blooded', 'Cold-blooded', 'Mammal', 'Bird']);
  setOptions(animals, ['Animals', 'Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich']);
}

classifications.addEventListener('change', () => {
  classificationsValue = classifications.options[classifications.selectedIndex].value;
  setOptions(animals, linkedOptions['classifications'][classificationsValue]);
});

animals.addEventListener('change', () => {
  animalsValue = animals.options[animals.selectedIndex].value;
  setOptions(classifications, linkedOptions['animals'][animalsValue]);
});

clearFilters.addEventListener('click', setDefault)
