/*
You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.

---PORBLEM---
input:
  - 1 argument, n number of switches
output:
  - array of lights that are on after n repitions

rules:
  - n is both total number of switches and repitions
    - last repition will always be the last light being switched
  - 1 indexed, not 0
    - last switch numbered n
  - result array contains integers that match order of lights that are on
  - all lights start as off before any iterations
   increse n by 1 on each repitition

---DATA---
- array of `switches` length, boolean (start with false)
  - return index of trues + 1


---ALGORITHM---
- create an array of boolean falses, of `switch` length
  - create an empty array `lights`
  - create a loop from 1 to `switch`
    - push `false` to `lights`
- loop 1 to `switch` times, switch multiples of current loop number up to `switch`
  - create for loop from initializor 1 , until initizor >  `switch`, increment initializor by 1
    - create a for loop for initializor2, until initalizor2 > `switch`, increment initalizor2 by `initializor`
      - switch `lights` array at element [initializor2 - 1]
- return array of on switches
  - create array `result`
  - iterate through `lights` w/ forEach, paramaters ele, index
    - if ele === true, push index + 1 to `result`
  - return result
*/

// - loop from `switch` / 2 (ceil if odd, + 1 if even) to switch, switching every switch of current loop number once


function lightsOn(switches) {
  const lights = []
  for (let i = 1; i <= switches; i += 1) {
    lights.push(false);
  }

  for (let n = 1; n <= switches; n += 1) {
    for (let multiples = n; multiples <= switches; multiples += n) {
      lights[multiples - 1] = !lights[multiples - 1];
    }
  }

  const result = []
  lights.forEach((ele, ind) => {
    if (ele === true) result.push(ind + 1);
  });

  return result;
}

console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights []
// Round 1: all lights are on [1,2,3,4,5]
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on [1, , 3, , 5]
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on [1, , , , 5]
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on [1, , , 4, 5]
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on [1, , , 4, ] [1, , , 4, ]

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

console.log(lightsOn(1));
console.log(lightsOn(0));
