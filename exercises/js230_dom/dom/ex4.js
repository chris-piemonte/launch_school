function sliceTree(start, end) {
  if (!document.getElementById(start) || !document.getElementById(end)) {
    return undefined;
  }

  const elementNames = [];
  let node = document.getElementById(end);

  do {
    elementNames.unshift(node.nodeName);
    node = node.parentNode;
  } while (node.nodeName !== 'BODY' && start.toString() !== node.id);
  elementNames.unshift(node.nodeName);

  if (elementNames[0] !== 'BODY') {
    return elementNames;
  } else {
    return undefined;
  }
}

sliceTree(1, 4);

sliceTree(1, 76);

sliceTree(2, 5);

sliceTree(5, 4);

sliceTree(1, 23);

sliceTree(1, 22);

sliceTree(11, 19);
