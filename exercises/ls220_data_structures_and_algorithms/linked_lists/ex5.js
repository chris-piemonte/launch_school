function ListNode(val) {
  this.val = val;
  this.next = null;
}

function createLinkedList(arr) {
  let head = new ListNode(0);
  let current = head;
  arr.forEach(val => {
    current.next = new ListNode(val);
    current = current.next;
  });
  return head.next;
}

function linkedListToArray(head) {
  let result = [];
  while (head) {
    result.push(head.val);
    head = head.next;
  }
  return result;
}

function testFrequencyList(input, expected) {
  let result = linkedListToArray(createFrequencyList(createLinkedList(input)));
  if (result.length !== expected.length) return false;
  let freq1 = new Map(), freq2 = new Map();
  for (let num of result) freq1.set(num, (freq1.get(num) || 0) + 1);
  for (let num of expected) freq2.set(num, (freq2.get(num) || 0) + 1);
  if (freq1.size !== freq2.size) return false;
  for (let [key, value] of freq1) {
    if (freq2.get(key) !== value) return false;
  }
  return true;
}

function createFrequencyList(head) {
  let frequency = {};
  let curr = head;

  while (curr) {
    // if (!Object.keys(frequency).includes(String(curr.val))) {
    //   frequency[curr.val] = 0;
    // }

    // frequency[curr.val] += 1;
    frequency[curr.val] = frequency[curr.val] + 1 || 1;
    curr = curr.next;
  }

  return createLinkedList(Object.values(frequency));
}

function createFrequencyList(head) {
  const frequencies = {};

  while (head) {
    if (!frequencies[head.val]) {
      frequencies[head.val] = 0;
    }

    frequencies[head.val] += 1;
    head = head.next;
  }

  values = Object.values(frequencies);
  let dummy = new ListNode(0);
  let curr = dummy;

  for (let num of values) {
    curr.next = new ListNode(num);
    curr = curr.next;
  }

  return dummy.next;
}

// Test cases
console.log(testFrequencyList([1, 1, 2, 1, 3], [3, 1, 1]));
console.log(testFrequencyList([1, 1, 2, 2, 2], [2, 3]));
console.log(testFrequencyList([6, 5, 4, 3, 2, 1], [1, 1, 1, 1, 1, 1]));
console.log(testFrequencyList([4, 4, 4, 4], [4]));
console.log(testFrequencyList([1, 2, 3, 4, 5], [1, 1, 1, 1, 1]));
console.log(testFrequencyList([], []));
console.log(testFrequencyList([1, 1, 1], [3]));
console.log(testFrequencyList([1, 2, 1, 2, 1, 2], [3, 3]));
// All test cases should log true.

// if (curr.next === null) {
//   curr = curr.next;
// } else if (used.includes(curr.next.val)) {
//   curr.next = curr.next.next;
// } else {
//   used.push(curr.next.val);
//   curr = curr.next;
// }
