function downloadFilePromise() {
  return new Promise((resolve) => {
    console.log("Downloading file...");
    setTimeout(() => {
      resolve("Download complete!");
    }, 1500);
  });
}

function processDataPromise(array, callback) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(array.map(callback));
    }, 1000);
  });
}

processDataPromise([1, 2, 3], (number) => number * 2).then((processedNumbers) => {
  console.log(processedNumbers);
});

function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() < .5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

flakyService().then(console.log).catch(console.error);

function operation() {
  return new Promise(resolve => {
    console.log("Operation started");
    setTimeout(() => {
      resolve("Operation complete");
    }, 1000);
  });
}

operation().then(console.log).finally(() => console.log("Cleaning up resources"));

function chain(num) {
  return new Promise(resolve => {
    resolve(num);
  });
}

chain(7).then(num => num *= 2).then(num => num += 5).then(console.log);
