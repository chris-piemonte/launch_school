function nodesToArr() {
  const result = ['BODY', Array.from(document.body.children).map(ele => [ele])]
  // [[header], [main], [footer]] 
  let currentParentNodes = result[1];

  while (anyChildren(currentParentNodes)) {
    currentParentNodes = getNextGenerationParents(currentParentNodes);
  }

  getNextGenerationParents(currentParentNodes);

  return result;
}

function anyChildren(parentNodes) {
  for (let i = 0; i < parentNodes.length; i += 1) {
    if (parentNodes[i][0].children.length > 0) return true;
  }
}

function getNextGenerationParents(currentParentNodes) {
  let newParentsNodes = [];
  currentParentNodes.forEach((parentNode, index, parentNodes) => {
    parentNodes[index] = appendChildren(parentNode);
    if (parentNodes[index][1].length > 0) {
      newParentsNodes = newParentsNodes.concat(parentNodes[index][1]);
    }
  });

  return newParentsNodes;
}

function appendChildren(parentNode) {
  const children = Array.from(parentNode[0].children).map(ele => [ele]);
  parentNode[0] = parentNode[0].tagName;
  parentNode.push(children);
  return parentNode;
}

nodesToArr();
