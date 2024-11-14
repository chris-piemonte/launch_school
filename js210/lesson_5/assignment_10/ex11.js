function dateSuffix(date) {
  date = date.getDate();
  if ([1, 21, 31].includes(date)) {
    return `${date}st`;
  } else if ([2, 22].includes(date)) {
    return `${date}nd`;
  } else if ([3, 23].includes(date)) {
    return `${date}rd`;
  } else {
    return `${date}th`;
  }
}

function formattedDay(date) {
  let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return daysOfWeek[date.getDay()];
}

function formattedMonth(date) {
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[date.getMonth()];
}

function formattedDate(date) {
  console.log(`Today's day is ${formattedDay(date)}, ${formattedMonth(date)} ${dateSuffix(date)}`);
}

let today = new Date();
let tomorrow = new Date(today.getTime());


tomorrow.setDate(today.getDate() + 1);
formattedDate(tomorrow);
