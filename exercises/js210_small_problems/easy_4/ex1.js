const DEGREE = '\u00B0';

function dms(angle) {
  while (angle > 360) {
    angle -= 360;
  }

  while (angle < 0) {
    angle += 360;
  }

  let degree = Math.floor(angle);
  let minutes = (angle % 1) * 60;
  let seconds = (minutes % 1) * 60;

  minutes = String(Math.floor(minutes));
  seconds = String(Math.floor(seconds));

  if (minutes.length === 1) {
    minutes = '0' + minutes;
  }

  if (seconds.length === 1) {
    seconds = '0' + seconds;
  }

  return `${degree}${DEGREE}${minutes}'${seconds}"`;
}

// All test cases should return true
console.log(dms(30) === "30°00'00\"");
console.log(dms(76.73) === "76°43'48\"");
console.log(dms(254.6) === "254°35'59\"");
console.log(dms(93.034773) === "93°02'05\"");
console.log(dms(0) === "0°00'00\"");
console.log(dms(360) === "360°00'00\"" || dms(360) === "0°00'00\"");

console.log(dms(-1));   // -1°00'00"
console.log(dms(400));  // 400°00'00"
console.log(dms(-40));  // -40°00'00"
console.log(dms(-420)); // 420°00'00"
