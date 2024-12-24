// Write a function `removeDuplicates` that removes all
// nodes with duplicate values from a sorted linked list,
// leaving only distinct values from the original list.
// The function should take the head of the sorted linked
// list as input and return the modified list. The list
// should remain sorted after removing duplicates. If the
// list becomes empty after removing all duplicates,
// return null.

// Example:
// Input: head = [1, 2, 2, 3, 3, 4, 5, 5]
// Output: [1, 4]
// Explanation: The values 2, 3, and 5 appear multiple times, so
//              they are removed. Only 1 and 4 remain as unique
//              values.

/*

---PROBLEM---
input: head of a linked list
output: head of same linked list with duplicate values removed

rules:
- removed duplicate values compltely, does not leave 1 of them
- output linked list must be in same order

---DATA---
- ahcnor and runner itteration

---ALGORITHM---
- create all necessary pointers
  - dummy node pointing to head
  - anchor pointing to the head
  - runner pointing to the 2nd node

- leave the anchor pointing to the head, move the runner through the rest of the nodes until it reaches null
  - if the value of the anchor and runner are the same, re-link other nodes to skip them
    - point dummy to node 2 if head is a duplicate
  - increment anchor to the next node, reassign runner to anchor

- return the node the dummy is pointing to

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

function removeDuplicates(head) {
  let dummy = new ListNode(0, head);
  let anchor = dummy, runner = head;

  while (runner.next !== null) {
    if (runner.val === runner.next.val) {
      let toSkip = runner.val;
      while (runner.val === toSkip) {
        if (runner.next === null) {
          anchor.next = null;
          return dummy.next;
        } else {
          runner = runner.next
        }
      }
    }

    if (runner.val === runner.next.val) continue;
    anchor.next = runner;
    anchor = anchor.next;
    runner = runner.next;
  }

  return dummy.next;
}

let list1 = createLinkedList([1, 2, 2, 3, 3, 4, 5, 5]);
let list2 = createLinkedList([1, 1, 1, 2, 3]);
let list3 = createLinkedList([1, 2, 3, 4, 5]);
let list4 = createLinkedList([1, 1, 1, 1, 1]);
let list5 = createLinkedList([1, 2, 2, 3, 3, 3, 4, 4, 5, 5, 5]);

printLinkedList(removeDuplicates(list1)); // Expected: 1 -> 4 -> null
printLinkedList(removeDuplicates(list2)); // Expected: 2 -> 3 -> null
printLinkedList(removeDuplicates(list3)); // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> null
printLinkedList(removeDuplicates(list4)); // Expected: null
printLinkedList(removeDuplicates(list5)); // Expected: 1 -> null
