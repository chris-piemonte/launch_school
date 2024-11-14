let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let today = new Date();

console.log(`Today's day is ${daysOfWeek[today.getDay()]}, the ${today.getDate()}`);
