function track(callback) {
  function isEventTracked(events, event) {
    return events.includes(event);
  }

  return event => {
    if (!isEventTracked(tracker.list(), event)) tracker.add(event);

    callback(event);
  }
}

const tracker = (() => {
  let events = [];
  return {
    add(event) {
      events.push(event);
    },

    list() {
      return events.slice();
    },

    elements() {
      return events.map(({target}) => target);
    },

    clear() {
      events = [];
      return events.length;
    },
  }
})();

let divRed = document.querySelector('#red');
let divBlue = document.querySelector('#blue');
let divOrange = document.querySelector('#orange');
let divGreen = document.querySelector('#green');

divRed.addEventListener('click', track(event => {
  document.body.style.background = 'red';
}));

divBlue.addEventListener('click', track(event => {
  event.stopPropagation();
  document.body.style.background = 'blue';
}));

divOrange.addEventListener('click', track(event => {
  document.body.style.background = 'orange';
}));

divGreen.addEventListener('click', track(event => {
  document.body.style.background = 'green';
}));

// tracker.list().length
// // 4
// tracker.elements()
// // [div#blue, div#red, div#orange, div#green]
// tracker.elements()[0] === document.querySelector('#blue')
// // true
// tracker.elements()[3] === document.querySelector('#green')
// // true
// tracker.list()[0]
// // click { target: div#blue, buttons: 0, clientX: 195, clientY: 190, layerX: 195, layerY: 190 }
// //  The event listed in `tracker` can differ by browser (Chrome - PointerEvent, Firefox - click)
// tracker.clear()
// // 0
// tracker.list()
// // []
// tracker.list()[0] = 'abc'
// tracker.list().length
// // 0

// divRed.addEventListener('click', console.log)
