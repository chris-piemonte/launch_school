// Write a function `reverseSegment` that reverses a segment
// of a singly linked list between two given positions,
// `start` and `end`. The function should take the head of
// the linked list and two integers, `start` and `end`, as
// input and return the modified list.

// The positions `start` and `end` are 1-indexed, and `start`
// is guaranteed to be less than or equal to `end`.

// The list is guaranteed to have at least one node, and `start`
// and `end` are guaranteed to be within the bounds of the list.

// Example:
// Input: head = [1, 3, 5, 7, 9], start = 2, end = 4
// Output: [1, 7, 5, 3, 9]
// Explanation: The segment from position 2 to 4 (3 -> 5 -> 7)
//              is reversed to (7 -> 5 -> 3).

/*

---PROBLEM---
input: head of linked list, start index to reverse order, end index to reverse order
output: head of linked list

rules:
- arguments 2 & 3 are 1-indexed
- all other nodes should remain unchanged
- the list should still end at null

---ALGORITHM---
- create a dummy node to point to the head for returning

- create pointers for previous and current, move them to the node preceeding the reversed segment and the start index of the reversed segment
- create a pointer at current, move it to the next node to the right of the segment to be reversed

- set a counter to end - start, create a loop until it hits 0
  - create a pointer at previous, move it counter + 1 spaces
  - create a 2nd pointer at previous, move it counter spaces
  - reassign the first counter's next ot the previous counter's node

- reassign previous.next's next to the pointer to the right of the reversed segment
- reassign previous.next to current

- return dummy.next
*/

class ListNode {
  constructor(val = 0, next = null) {
    this.val = val;
    this.next = next;
  }
}

function printLinkedList(head) {
  let currentNode = head;
  let listStr = '';
  while (currentNode !== null) {
    listStr += currentNode.val + ' -> ';
    currentNode = currentNode.next;
  }
  listStr += 'null';
  console.log(listStr);
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




function reverseSegment(head, start, end) {
  let dummy = new ListNode(0, head);
  let prev = dummy, curr = dummy;
  let numToRotate = end - start;

  while (start > 1) {
    prev = prev.next;
    start -= 1;
  }
  while (end > 0) {
    curr = curr.next;
    end -= 1;
  }

  let endListNode = curr.next;  
  while (numToRotate > 0) {
    let reverse = prev.next;
    let newNext = prev;
    let numToMove = numToRotate;
    while (numToMove > 0) {
      newNext = newNext.next;
      reverse = reverse.next;
      numToMove -= 1;
    }
    reverse.next = newNext;
    numToRotate -= 1;
  }

  prev.next.next = endListNode;
  prev.next = curr;

  return dummy.next;
}




function reverseSegment(head, start, end) {
  if (head.next === null) return head;

  let dummy = new ListNode(0, head);
  let firstSegmentEnd = dummy, firstRotationNode = dummy;

  while (start > 1) {
    firstSegmentEnd = firstSegmentEnd.next;
    start -= 1;
  }
  while (end > 0) {
    firstRotationNode = firstRotationNode.next;
    end -= 1;
  }

  let prev = firstSegmentEnd.next, curr = prev.next, future = curr.next;
  prev.next = firstRotationNode.next;

  while (prev !== firstRotationNode) {
    curr.next = prev;
    prev = curr;
    curr = future;
    if (future === null) continue;
    future = future.next;
  }

  firstSegmentEnd.next = prev;
  return dummy.next;
}

let list1 = createLinkedList([1, 3, 5, 7, 9]);
let list2 = createLinkedList([1, 2, 3]);
let list3 = createLinkedList([1]);
let list4 = createLinkedList([1, 2, 3, 4, 5, 6]);
let list5 = createLinkedList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

printLinkedList(reverseSegment(list1, 2, 4)); // Expected: 1 -> 7 -> 5 -> 3 -> 9 -> null
printLinkedList(reverseSegment(list2, 1, 3)); // Expected: 3 -> 2 -> 1 -> null
printLinkedList(reverseSegment(list3, 1, 1)); // Expected: 1 -> null
printLinkedList(reverseSegment(list4, 3, 5)); // Expected: 1 -> 2 -> 5 -> 4 -> 3 -> 6 -> null
printLinkedList(reverseSegment(list5, 4, 7)); // Expected: 1 -> 2 -> 3 -> 7 -> 6 -> 5 -> 4 -> 8 -> 9 -> 10 -> null
