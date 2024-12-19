// Write a function `rooms` that determines the minimum number of
// rooms required to handle a series of interviews given their
// time intervals.

// Each interval is represented as an array [start, end],
// where `start` is the start time and `end` is the end
// time of the interview.

// The function should return the number of conference rooms
// required to ensure no two interviews overlap in the same room.

// Example I:
// Input: intervals = [[20, 25], [10, 15], [0, 25]]
// Output: 2
// Explanation: The first interview is scheduled from
//              time 0 to 25. The second interview is
//              from time 10 to 15 and overlaps with
//              the first interview, requiring a second
//              room. The third interview from 20 to 25
//              also overlaps with the first. Thus, a
//              minimum of two rooms are required.

// Example II:
// Input: intervals = [[5, 9], [1, 3]]
// Output: 1
// Explanation: The first interview is scheduled from
//              time 5 to 9. The second interview is
//              from time 1 to 3. These two interviews
//              do not overlap, therefore only one
//              conference room is needed.

/*

---PROBLEM---
input: array of 2-element sub-arrays indicating start & end times of interviews
output: minimum numbr of rooms needed to conduct all interviews w/o any needing to wait for a room

rules:
- index 0 of each array is start time, index 1 of each array is end time
- a new room must beincluded if any 2 sub-arrays have overlappiong times
- sub-arrays are not arranged chronologically
- always at least 1 sub-array

---DATA---
- 2 arrays, one with start times one with end times
- 2 pointers, one to iterate through each array

---ALGORITHM---
Helper Method:
- create 2 arrays, 1 with all start times 1 with all end times, in order
  - create empty arrays for `startTimes` and `endTimes`
  - iterate through input array
    - push index 0 of each sub-array to `startTimes`
    - push index 1 of each sub-array to `endTimes`

- create a pointer for each array, starting at index 0

- create variables for current # of rooms and max # of rooms, starting with 1 each

- iterate through both arrays using pointers, updating number of rooms and pointers as necessary
  - compare the value of the curent index in `startTimes` & `endTImes`
    - if `startTimes is bigger than `endTimes` increment `endTimes` by 1
    - if `startTimes` is smaller than or equal `endTimes` increment `startTimes by 1
    - if (start - end) indexes + 1 > max # of rooms, reassign it

- return max # of rooms

current number of rooms:0
max number of rooms: 2
most recent end time: 255
[0*, 10*, 20*]
[15*, 25*, 25*]

*/

function rooms(interviews) {
  const startTimes = [];
  const endTimes = [];
  subArrays(interviews, startTimes, endTimes);
  let startPointer = 0, endPointer = 0;
  let maxRooms = 1

  while (startPointer < startTimes.length) {
    if (startTimes[startPointer + 1] < endTimes[endPointer]) {
      startPointer += 1;
    } else if (startTimes[startPointer + 1] === endTimes[endPointer]) {
      startPointer += 1;
      endPointer += 1;
    } else {
      endPointer += 1;
    }

    maxRooms = Math.max(startPointer - endPointer + 1, maxRooms);
  }

  return maxRooms;
}

function subArrays(interviews, start, end) {
  interviews.forEach(sub => {
    start.push(sub[0]);
    end.push(sub[1]);
  });

  start.sort((a, b) => a - b);
  end.sort((a, b) => a - b);
}

// Test Cases:

console.log(rooms([[20, 25], [10, 15], [0, 25]]) === 2);
console.log(rooms([[5, 9], [1, 3]]) === 1);
console.log(rooms([[1, 2], [3, 4], [5, 6]]) === 1);
console.log(rooms([[1, 4], [2, 5], [3, 6]]) === 3);
console.log(rooms([[1, 3], [3, 6], [6, 8]]) === 1);
console.log(rooms([[1, 10]]) === 1);
console.log(rooms([[1, 3], [2, 4], [4, 6]]) === 2);
console.log(rooms([[1, 5], [2, 3], [4, 6], [5, 7]]) === 2);
console.log(rooms([[0, 5], [1, 3], [2, 6], [4, 7], [5, 9], [8, 10]]) === 3);
console.log(rooms([[1, 2], [2, 3], [3, 4], [4, 5]]) === 1);
console.log(rooms([[1, 20], [5, 10], [11, 15], [16, 18]]) === 2);
console.log(rooms([[1, 4], [1, 3], [1, 2], [1, 5]]) === 4);
// All test cases should log true
