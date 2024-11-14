function date(number) {
  if ([1, 21, 31].includes(number)) {
    return `${number}st`;
  } else if ([2, 22].includes(number)) {
    return `${number}nd`;
  } else if ([3, 23].includes(number)) {
    return `${number}rd`;
  } else {
    return `${number}th`;
  }
}

let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
let today = new Date();

console.log(`Today's day is ${daysOfWeek[today.getDay()]}, ${months[today.getMonth()]} ${date(today.getDate())}`);
