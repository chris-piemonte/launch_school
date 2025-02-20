type Device = {
  manufacturer: string,
  model: string,
  year: number,
}

let computer: Device = {
  manufacturer: 'Razer',
  model: 'Blade',
  year: 2018,
};

let smartphone = {
  manufacturer: 'Samsung',
  model: 'Galaxy',
  year: 2022,
  headphoneJack: false,
}

let anotherSmartphone: Device = smartphone;
