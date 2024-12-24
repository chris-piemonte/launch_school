// Given the root node of a binary tree, implement a
// function `preorderTraversal`, that returns an
// array containing the values of the nodes visited in
// a preorder traversal.

// Your task is to implement the function iteratively using a stack.

/*

---PROBLEM---
input: root node of a binary tree
output: array of tree node values in preorder traversal

rules:
- tree must be iterated using a stack.
- must push values to array in NLR order
- always push current nodes value to stack before looking at L or R

---DATA---
- stack

---ALGORITHM---
- crete necessary variables and pointers
  - empty array `result`
  - array `stack` with root as first element

- while stack is not empty
  - pop node out of `stack`
    - push value to `result`
    - if there is a node to the right, push it to stack;
    - if there is a node to the left, push it to stack

*/

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

function preorderTraversal(root) {
  const stack = [root];
  const result = [];

  while (stack.length > 0) {
    const node = stack.pop()
    result.push(node.val);
    if (node.right) stack.push(node.right);
    if (node.left) stack.push(node.left);
  }

  return result;
}

// Test Cases:

const tree1 = buildTree([1, null, 2, 3]);
console.log(preorderTraversal(tree1)); // Output: [1, 2, 3]

const tree2 = buildTree([1, 2, 3, null, null, 4, null, null, 5]);
console.log(preorderTraversal(tree2)); // Output: [1, 2, 3, 4, 5]

const tree3 = buildTree([5, 3, null, 2, null, 1, null]);
console.log(preorderTraversal(tree3)); // Output: [5, 3, 2, 1]

const tree4 = buildTree([10, 5, 15, null, 6, 12, 21, null, null, 11]);
console.log(preorderTraversal(tree4)); // Output: [10, 5, 6, 15, 12, 11, 21]
