/*

We were asked to implement a task list and the following functionality:

adding a new task
completing a given number of existing tasks
displaying the task list
We decided to keep things simple and model the tasks as strings. Completing a task for us simply means deleting the string from the array of tasks.

Experimenting with our code reveals that it doesn't work exactly as we expected. Find the problem and fix it.

*/

const todos = ['wash car', 'exercise', 'buy groceries', 'balance budget',
  'call plumber', 'feed fido', 'get gas',  'organize closet'];

function addTask(task) {
if (todos.includes(task)) {
console.log('That task is already on the list.');
} else {
todos.push(task);
}
}

function completeTasks(n = 1) {
let tasksComplete = 0;

while (todos.length > 0 && tasksComplete < n) {
console.log(`${todos[0]} complete!`);
delete todos[0];
tasksComplete++;
}

if (todos.length === 0) {
console.log('All tasks complete!');
} else {
console.log(`${tasksComplete} tasks completed; ${todos.length} remaining.`);
}
}

function displayTaskList() {
console.log(`ToDo list (${todos.length} tasks):`)
console.log('---------------------');

for (let i = 0; i < todos.length; i++) {
console.log(`-- ${todos[i]}`);
}
}

// Utilizing our task manager

addTask('oil change');
addTask('dentist');
addTask('homework');

completeTasks(3);
displayTaskList();

// On line 30 executing `delete todos[0]` does not delete the specified index from the array, it deletes the element property from the array object & replaces it with an empty slot.
// todos.shift();
