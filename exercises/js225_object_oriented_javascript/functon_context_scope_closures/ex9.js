// const name = 'Naveed';
// const greeting = 'Hello';

// My Way:

// const greeter = (function() {
//   const name = 'Naveed'
//   const greeting = 'Hello';

//   return {
//     message: `${greeting} ${name}!`,
//     sayGreetings() {
//       console.log(this.message);
//     }
//   };
// })();

// console.log(greeter);

// Their Way:

const greeter = {
  message: (function() {
    const name = 'Naveed';
    const greeting = 'Hello';

    return `${greeting} ${name}!`
  })(),

  sayGreetings() {
    console.log(this.message);
  }
};

console.log(greeter);
