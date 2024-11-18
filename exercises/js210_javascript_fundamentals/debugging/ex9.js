// const totalPages = 364;
// let energy = 100;

// function read() {
//   let currentPage = 1;

//   while (energy > 0 && currentPage < totalPages) {
//     currentPage += 1;
//     energy -= (5 + currentPage * 0.1);
//   }

//   console.log(`Made it to page ${String(currentPage)}.`);

//   // Drink a cup of coffee.
//   energy = 100;

//   // Continue reading.
//   if (currentPage < totalPages) {
//     read();
//   } else {
//     console.log('Done!');
//   }
// }

// read();

// on line 5 we are reassigning currentPage to 1 every time read() is called, causing an infinite loop. You can move it outside of the function to fix it.

const totalPages = 364;
let energy = 100;
let currentPage = 1;

function read() {
  while (energy > 0 && currentPage < totalPages) {
    currentPage += 1;
    energy -= (5 + currentPage * 0.1);
  }

  console.log(`Made it to page ${String(currentPage)}.`);

  // Drink a cup of coffee.
  energy = 100;

  // Continue reading.
  if (currentPage < totalPages) {
    read();
  } else {
    console.log('Done!');
  }
}

read();
