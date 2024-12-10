/*

The following code demonstrates the Pomodoro technique. Although it seems to work in principle, it never prints the minute count from line 11. What is wrong?

*/

var tasks = 10;
var checkmarks = 0;
var sessions = 0;
var minutes = 0;

function pomodoro() {
  console.log('Work.');

  while (minutes < 25) {
    minutes += 1;
    console.log('...' + minutes);
  }

  console.log('PLING!');

  sessions += 1;
  checkmarks += 1;

  if (checkmarks === tasks) {
    console.log('Done!');
    return;
  }

  var rest;
  if (sessions === 4) {
    sessions = 0;
    rest = 30;
  } else {
    rest = 5;
  }

  console.log('Rest for ' + rest + ' minutes.');

  var minutes = 0;
  pomodoro();
}

pomodoro();

// On line 40 `var minutes = 0` is hoisted to the top ofpomodoro and declared, and initialized to undefined. This is a case of variable shadowing over the minutes declared on line 10. Undefined < 0 evaluates to false so the block from line 15 - 18 never runs. To fix it you need to reassign minutes to 0 on line 40 withut re-declaring it.
// minutes = 0;
