/*
Write a function that returns the position of the closest active opponent. If two opponents are equidistant, return the opponent with the higher position on the board.

---PROBLEM---
input:
  - 2 arguments
    - first argument object with players and positions
      - positioon always integer
    - second argument will be position to compare players to
output:
  - position of active opponent closest to the 2nd argument postion
  - if 2 opponents are equadistant, return opponent with higherst position value

rules:
  - arguments will always be objects and position to compare in correct order
  - oppopnent positions will always be integer or null
    - if null, player is out, do not consider them
  - object with player infor will always be string of opponent name, and position as integer
  - position to compare to will always be positive intger

--- DATA---
- array of opponent positions
- variable trackers for the current closest opponent position and how far away it was

---ALGORITHM---
- validate data
  - check if `positions` is empty by creating array of keys, check length
    - if so, return null
- create array of values of `positions`
  - reassign `positions` to array of its values
- create 2 variables to track closest opponent position and how far it was
  - create variable  `closestPosition`, set to first element of `positions`
  - create variable `closestDistance`, set to absolute value of `closestPosition` - `position`
- iterate through opponent positions array, check distance to `position` & reassign variables if it's closer
  - iterate through positions with forEach, element parameter
    - if element === `null` continue to next iteration
    - check if abcolute value of distance between current elemnt and `position` <= `closestDistance`
      - if yes
        - if num > `currentPosition` reassign `closestPosition` to cureent element
        - reassign `closestDistance` to absolute value of `closestPosition` - `position`
- return the value of `closestPosition`

*/

function findClosestOpponent(positions, position) {
  if (Object.keys(positions).length === 0) return null;

  positions = Object.values(positions);

  let closestPosition = positions[0];
  let closestDistance = Math.abs(closestPosition - position);

  positions.forEach(num => {
    if (num === null) return;
    if (Math.abs(num - position) <= closestDistance) {
      if (num > closestPosition) closestPosition = num;
      closestDistance = Math.abs(num - position);
    }
  });

  return closestPosition;
}

console.log(findClosestOpponent({
  "Opponent 1" : 1,
  "Opponent 2" : 15,
  "Opponent 3" : 37
}, 10)); // 15

console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5
}, 3)); // 5

console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5,
  "Opponent 1c" : 50,
  "Opponent 1d" : 100,
  "Opponent 1e" : null
}, 150)); // 100

// equidistent
console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5,
  "Opponent 1c" : 50,
  "Opponent 1d" : 100,
  "Opponent 1e" : 200,
}, 75)); // 100

console.log(findClosestOpponent({
}, 3)); // null

console.log(findClosestOpponent({}, 74)); // null

console.log(findClosestOpponent({
  "Opponent 1a" : null, "Opponent 1b" : 5, "Opponent 1c" : null,
  "Opponent 1d" : null, "Opponent 1e" : 200, "Opponent 1f" : 400
}, 300)); // 400

console.log(findClosestOpponent({
  "Atlas" : 1,
  "Luna" : 15,
  "" : 37
}, 10)); // 15
