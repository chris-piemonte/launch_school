// Given an undirected graph represented by an edge list, determine if
// there is a path between specified source and destination vertices.

// Implement the function `hasPath` that takes three arguments:
// an edge list representing the graph, a source vertex, and a
// destination vertex. The function should return true if a path
// exists between the source and destination, and false otherwise.

function hasPath(edgeList, src, dst) {
  const visited = [];

  function createAdjacencyList(edgeList) {
    const adjacencyList = new Map();
  
    edgeList.forEach(([vert1, vert2]) => {
      if (!adjacencyList.get(vert1)) {
        adjacencyList.set(vert1, [vert2]);
      } else {
        adjacencyList.get(vert1).push(vert2);
      }

      if (!adjacencyList.get(vert2)) {
        adjacencyList.set(vert2, [vert1]);
      } else {
        adjacencyList.get(vert2).push(vert1);
      }
    });

    return adjacencyList;
  }

  function helper(adjList, src, dst) {
    if (src === dst) return true;
    if (visited.includes(src)) return false;

    visited.push(src);
    for (let vert of adjList.get(src)) {
      if (helper(adjList, vert, dst)) return true;
    }

    return false;
  }

  return helper(createAdjacencyList(edgeList), src, dst);
}



console.log(hasPath([[1, 2], [2, 3], [3, 4]], 1, 4) === true);
console.log(hasPath([[1, 2], [3, 4]], 1, 4) === false);
console.log(hasPath([[1, 2], [1, 3], [2, 4], [3, 4], [3, 5], [5, 6]], 1, 6) === true);
console.log(hasPath([], 1, 1) === true);
console.log(hasPath([[1, 2], [1, 3], [4, 5], [6, 7]], 2, 5) === false);
console.log(hasPath([[1, 2], [2, 3], [3, 4], [4, 5], [1, 5], [2, 6], [6, 7], [7, 8], [8, 5]], 1, 8) === true);
console.log(hasPath([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 3], [2, 7], [7, 8], [8, 7], [7, 9], [9, 10], [10, 11], [11, 12], [12, 10], [7, 13]], 1, 13) === true);
console.log(hasPath([[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [6, 4], [7, 8], [8, 9], [9, 10], [10, 7], [11, 12], [13, 14], [14, 15], [15, 13]], 1, 12) === false);
// All test cases should log true
