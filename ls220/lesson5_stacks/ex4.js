// Given the root node of a binary tree, implement a
// function `inorderTraversal` that returns an
// array containing the values of the nodes visited in
// an inorder traversal.

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
input: root node
output: array of node values in LNR order (iniorder traversal)

rules:
- tree must be incremented from left to right (LNR)
- must use stack


---DATA---
- stack array
- results array

---ALGORITHM---
- create all necessary containers
  - `stack`
  - `result`

- put first node in stack

- create a loop until the stack is empty
  - remove top node form stack
    - if it has a left node, push current node then left node into stack
    - if it has no left node, push node value to `result`, check if it has right node
      - if so, puysh right node top stack

- return `result`

*/

function inorderTraversal(root) {
  const result = [];
  const stack = [root];

  let peek = stack[stack.length - 1];
  while (peek.left) {
    stack.push(peek.left);
    peek = peek.left;
  }

  while (stack.length > 0) {
    const node = stack.pop();
    result.push(node.val);
    if (node.right) {
      stack.push(node.right);
      let peek = stack[stack.length - 1];
      while (peek.left) {
        stack.push(peek.left);
        peek = peek.left;
      }
    }
  }

  return result;
}




function inorderTraversal(root) {
  const result = [];
  const stack = [];
  let curr = root;

  while (curr !== null || stack.length > 0) {
    if (curr !== null) { 
      stack.push(curr);
      curr = curr.left;
    }

    if (curr === null) {
      const node = stack.pop();
      result.push(node.val);
      curr = node.right;
    }
  }

  return result;
}

// Test Cases:

const tree1 = buildTree([1, null, 2, 3]);
console.log(inorderTraversal(tree1)); // Output: [1, 3, 2]

const tree2 = buildTree([1, 2, 3, null, null, 4, null, null, 5]);
console.log(inorderTraversal(tree2)); // Output: [2, 1, 4, 5, 3]

const tree3 = buildTree([5, 3, null, 2, null, 1, null]);
console.log(inorderTraversal(tree3)); // Output: [1, 2, 3, 5]

const tree4 = buildTree([10, 5, 15, null, 6, 12, 21, null, null, 11]);
console.log(inorderTraversal(tree4)); // Output: [5, 6, 10, 11, 12, 15, 21]
