let title = "The Three-Body Problem"; // use single quotes with strings, unless strings contain quotes

let title = 'The Three-Body Problem';

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

let title = 'The Three-Body Problem', // use let, const, or var when declaring variables, and variables should be camelCase
    author = 'Cixin Liu',
    page_count = 400;

let title = 'The Three-Body Problem';
let author = 'Cixin Liu';
let pageCount = 400;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

let completed = lastPageRead == 400; // always use the strict equality operator

let completed = lastPageRead === 400;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (finishedBook()) // use { } around multi-line it statements
  console.log('You have finished reading this book');

if (finishedBook()) {
  console.log('You have finished reading this book');
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function read(pages) {
  console.log('You started reading.');
  for (let page=0; page<pages; page++) {
          let message = 'You read page '+page;
          console.log(message);
  }
}

read(400); // use 2 spaces to indent code, surround operators with spaces, use explicit string coercion, acoud ++/--, use named function expressions instead of function declarations

let read = function read(pages) {
  console.log('You started reading.');
  for (let page = 0; page < pages; page += 1) {
    let message = 'You read page '+ String(page);
    console.log(message);
  }
}

read(400);
