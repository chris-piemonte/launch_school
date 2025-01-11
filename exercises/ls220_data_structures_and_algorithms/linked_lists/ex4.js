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
function printLinkedList(head) {
  let current = head;
  let listStr = '';
  while (current !== null) {
    listStr += current.val + ' -> ';
    current = current.next;
  }
  listStr += 'null';
  console.log(listStr);
}

// function mergeSortedLists(list1, list2) {
//   if (!list1) return list2;
//   if (!list2) return list1;

//   const head = list1.val < list2.val ? list1 : list2;
//   let currhead = head;
//   let curr1 = list1;
//   let curr2 = list2;

//   if (curr1.val === head.val) {
//     curr1 = curr1.next;
//   } else {
//     curr2 = curr2.next;
//   }

//   while (curr1 && curr2) {
//     if (curr1.val < curr2.val) {
//       currhead.next = curr1;
//       currhead = currhead.next;
//       curr1 = curr1.next;
//     } else {
//       currhead.next = curr2;
//       currhead = currhead.next;
//       curr2 = curr2.next;
//     }
//   }

//   while (curr1) {
//     currhead.next = curr1;
//     currhead = currhead.next;
//     curr1 = curr1.next;
//   }

//   while (curr2) {
//     currhead.next = curr2;
//     currhead = currhead.next;
//     curr2 = curr2.next;
//   }

//   return head;
// }

function mergeSortedLists(list1, list2) {
  let dummy = new ListNode(0);
  let curr = dummy;

  while (list1 && list2) {
    if (list1.val < list2.val) {
      curr.next = list1;
      list1 = list1.next;
    } else {
      curr.next = list2;
      list2 = list2.next;
    }

    curr = curr.next;
  }

  curr.next = list1 !== null ? list1 : list2;
  return dummy.next;
}

function mergeSortedLists(listA, listB) {
  if (!listA && !listB) return listA;
  if (!listA && listB) return listB;
  if (!listB && listA) return listA;

  let dummy = new ListNode(0);
  let curr = dummy;
  let pointerA = listA;
  let pointerB = listB;

  while (pointerA && pointerB) {
    if (pointerA.val <= pointerB.val) {
      curr.next = pointerA;
      curr = curr.next;
      pointerA = pointerA.next
    } else {
      curr.next = pointerB;
      curr = curr.next;
      pointerB = pointerB.next
    }

    if (!pointerA) curr.next = pointerB;
    if (!pointerB) curr.next = pointerA;
  }

  return dummy.next;
}

let list1 = createLinkedList([1, 3, 5]);
let list2 = createLinkedList([2, 4, 6]);
printLinkedList(mergeSortedLists(list1, list2)); // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> null

let list3 = createLinkedList([1, 2, 3]);
let list4 = createLinkedList([]);
printLinkedList(mergeSortedLists(list3, list4)); // Expected: 1 -> 2 -> 3 -> null

let list5 = createLinkedList([]);
let list6 = createLinkedList([1]);
printLinkedList(mergeSortedLists(list5, list6)); // Expected: 1 -> null

let list7 = createLinkedList([1, 5, 9]);
let list8 = createLinkedList([2, 4, 6, 8, 10]);
printLinkedList(mergeSortedLists(list7, list8)); // Expected: 1 -> 2 -> 4 -> 5 -> 6 -> 8 -> 9 -> 10 -> null

let list9 = createLinkedList([1, 2, 5]);
let list10 = createLinkedList([3, 6, 7]);
printLinkedList(mergeSortedLists(list9, list10)); // Expected: 1 -> 2 -> 3 -> 5 -> 6 -> 7 -> null
