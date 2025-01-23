// const franchise = {
//   name: 'How to Train Your Dragon',
//   allMovies() {
//     return [1, 2, 3].map(function(number) {
//       return `${this.name} ${number}`;
//     });
//   },
// };

// console.log(franchise.allMovies());

// This will not return the desired array because map uses a clalback function which does not retain the same context as the calling function allMovies().

const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    self = this;
    return [1, 2, 3].map(function(number) {
      return `${self.name} ${number}`;
    });
  },
};

console.log(franchise.allMovies());
