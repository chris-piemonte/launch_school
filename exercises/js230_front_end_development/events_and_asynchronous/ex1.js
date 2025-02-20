function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(...callbacks) {
  const endTime = callbacks.length * 2;
  let time = 0;

  const timeLogger = setInterval(() => {
    time += 1;
    console.log(time);
    if (time >= endTime) clearInterval(timeLogger);
  }, 1000);

  callbacks.forEach(callback => {
    const executeTime = Math.floor(Math.random() * endTime * 1000);
    setTimeout(callback, executeTime);
  });
}

randomizer(callback1, callback2, callback3);

// Output:
// 1
// 2
// "callback2"
// 3
// "callback3"
// 4
// 5
// "callback1"
// 6
