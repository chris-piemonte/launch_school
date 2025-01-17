// Problem 1/2:

let turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  },
};

function logReturnVal(func, context) {
  let returnVal = func.call(context);
  console.log(returnVal);
}

logReturnVal(turk.getDescription, turk);

// Problem 3:

let getTurkDescription = turk.getDescription.bind(turk);

// Problem 4/5:

// let TESgames = {
//   titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
//   seriesTitle: 'The Elder Scrolls',
//   listGames() {
//     this.titles.forEach(title => {
//       console.log(this.seriesTitle + ' ' + title);
//     });
//   }
// };

// TESgames.listGames();

// Problem 6:

// let TESgames = {
//   titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
//   seriesTitle: 'The Elder Scrolls',
//   listGames() {
//     let self = this;
//     self.titles.forEach(function(title) {
//       console.log(self.seriesTitle + ' ' + title);
//     });
//   }
// };

// TESgames.listGames();

// Problem 7:

let TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    }, this);
  }
};

TESgames.listGames();

// Problem 8/9:

// let foo = {
//   a: 0,
//   incrementA() {
//     function increment() {
//       this.a += 1;
//     }

//     increment.call(this);
//   }
// };

// foo.incrementA();
// foo.incrementA();
// foo.incrementA();

// console.log(foo.a);

// Problem 10:

let foo = {
  a: 0,
  incrementA() {
    let increment = function() {
      this.a += 1;
    }.bind(this);

    increment.apply(this);
    increment.apply(this);
    increment.apply(this);
  }
};
