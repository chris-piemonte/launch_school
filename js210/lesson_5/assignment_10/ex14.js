function formatTime(date) {
  let hours = String(date.getHours());
  let minutes = String(date.getMinutes());

  if (hours.length === 1) hours = '0' + hours;
  if (minutes.length === 1) minutes = '0' + minutes;

  console.log(`${hours}:${minutes}`);
}

let today = new Date('March 13, 08 04:05');
formatTime(today);
