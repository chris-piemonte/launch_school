// Implement a function `dfs` that accepts two arguments: an adjacency
// list representing an undirected graph, and a starting vertex (source).
// The function should print the vertices in preorder depth-first
// traversal order.


// Implement a function `dfs` that accepts two arguments: an adjacency
// list representing an undirected graph, and a starting vertex (source).
// The function should print the vertices in preorder depth-first
// traversal order.

// function dfs(adjList, source) {
//   const visited = new Set([source]);
//   const stack = [source];

//   while (stack.length > 0) {
//     current = stack.pop();
//     console.log(current)
    
//     adjList.get(current).forEach(val => {
//       if (!visited.has(val)) {
//         stack.push(val);
//         visited.add(val);
//       }
//     });
//   }
// }

// const adjList = new Map();
// adjList.set(1, [2]);
// adjList.set(2, [1, 3]);
// adjList.set(3, [2]);

// dfs(adjList, 1); // 1, 2, 3

function bfs(adjList, source) {
  const visited = new Set([source]);
  let queue = [source]

  while (queue.length > 0) {
    const current = queue.shift();
    console.log(current);

    adjList.get(current).forEach(val => {
      if (!visited.has(val)) {
        queue.push(val);
        visited.add(current);
      }
    });
  }
}

const adjList = new Map();
adjList.set(1, [2, 3]);
adjList.set(2, [1, 4]);
adjList.set(3, [1, 4, 5]);
adjList.set(4, [2, 3]);
adjList.set(5, [3, 6]);
adjList.set(6, [5]);

console.log(bfs(adjList, 1)); // 1, 2, 3, 4, 5, 6 or 1, 3, 2, 5, 4, 6
