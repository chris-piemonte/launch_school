function basicCallback(callback, num) {
  setTimeout(() => {
    callback(num);
  }, 2000);
}

basicCallback((number) => {
  console.log(number * 2);
}, 5);

function downloadFile(callback) {
  console.log("Downloading file...");
  setTimeout(() => {
    callback("Download complete!");
  }, 1500);
}

function processData(array, callback) {
  setTimeout(() => {
    console.log(array.map(callback));
  }, 1000);
}

processData([1, 2, 3], (number) => number * 2);

function waterfallOverCallbacks(callbackArray, num) {
  let curr = num;

  callbackArray.forEach(cb => curr = cb(curr));

  console.log(curr);
}

const double = (x) => x * 2;
waterfallOverCallbacks([double, double, double], 1);

function startCounter(callback) {
  let counter = 0;

  let interval = setInterval(() => {
    counter += 1;
    if (callback(counter)) clearInterval(interval);
  }, 1000);
}

startCounter((count) => {
  console.log(count);
  return count === 5;
});
