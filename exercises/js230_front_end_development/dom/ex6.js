function nodeSwap(indOne, indTwo) {
  let nodeOne = document.getElementById(indOne);
  let nodeTwo = document.getElementById(indTwo);

  if (!nodeOne || !nodeTwo ||
      nodeOne.contains(nodeTwo) || nodeTwo.contains(nodeOne))
      return undefined;

  let placeholder = document.createElement('div')
  nodeOne.insertAdjacentElement('beforebegin', placeholder);
  nodeTwo.insertAdjacentElement('beforebegin', nodeOne);
  placeholder.parentElement.replaceChild(nodeTwo, placeholder);
}

// one swap
nodeSwap(1, 2);

// multiple swaps
nodeSwap(3, 1);
nodeSwap(7, 9);


// invalid swaps

// at least one of the id attributes doesn't exist
nodeSwap(1, 20);
// undefined
// at least one of the nodes is a "child" of the other
nodeSwap(1, 4);
nodeSwap(9, 3);
// undefined
