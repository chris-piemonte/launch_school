// Given the root node of a binary tree, implement a
// function `postorderTraversal` that returns an
// array containing the values of the nodes visited in
// an postorder traversal.

// Your task is to implement the function iteratively using a stack.

class Node {
  constructor(value) {
    this.val = value;
    this.left = null;
    this.right = null;
  }
}

// Helper function for test cases
function buildTree(arr) {
  if (arr.length === 0) {
    return null;
  }

  const nodes = [];

  const val = arr.shift();
  const root = new Node(val);
  nodes.push(root);

  while (arr.length > 0) {
    const curr = nodes.shift();

    const leftVal = arr.shift();
    if (leftVal !== null) {
      curr.left = new Node(leftVal);
      nodes.push(curr.left);
    }

    if (arr.length > 0) {
      const rightVal = arr.shift();
      if (rightVal !== null) {
        curr.right = new Node(rightVal);
        nodes.push(curr.right);
      }
    }
  }

  return root;
}

/*

---PROBLEM---
input: root node of binary tree
output: aray of results in postorder travesal (LRN)

rules:
- must use stack
- nodes should be in result array in LRN

---DATA---
- array stack to traverse tree
- arrray stack to store nodes in order that they should be processed
- result array

---ALGORITHM---
- declare all nexeccary containers and pointers
- empty result array
  - traversal stack array with root in it
  - empty process nodes stack array


- while the traversal stack isn't empty
  - pop the top node out of the traversal stack
    - push current into the process stack
    - push left into the traversal stack if it isn't null
    - push right into the traversal stack if it isn't null


- while the process stack isn't empty
  - pop out the top node and push the value to result

*/

function postorderTraversal(root) {
  const result = [];
  const processStack = [];
  const traversalStack = [root];

  while (traversalStack.length > 0) {
    const node = traversalStack.pop();
    processStack.push(node);
    if (node.left) traversalStack.push(node.left);
    if (node.right) traversalStack.push(node.right);
  }

  while (processStack.length > 0) {
    result.push(processStack.pop().val);
  }

  return result;
}

// Test cases
const tree1 = buildTree([1, null, 2, 3]);
console.log(postorderTraversal(tree1)); // Output: [3, 2, 1]

const tree2 = buildTree([1, 2, 3, null, null, 4, null, null, 5]);
console.log(postorderTraversal(tree2)); // Output: [2, 5, 4, 3, 1]

const tree3 = buildTree([5, 3, null, 2, null, 1, null]);
console.log(postorderTraversal(tree3)); // Output: [1, 2, 3, 5]

const tree4 = buildTree([10, 5, 15, null, 6, 12, 21, null, null, 11]);
console.log(postorderTraversal(tree4)); // Output: [6, 5, 11, 12, 21, 15, 10]
