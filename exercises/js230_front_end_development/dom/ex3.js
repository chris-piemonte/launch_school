function domTreeTracer(id, arr=[]) {
  let result = [];
  let parent = document.getElementById(id).parentNode;

  Array.from(parent.children).forEach(node => {
    result.push(node.nodeName);
  });
  arr.push(result);

  if (parent.parentNode.nodeName !== 'HTML') {
    domTreeTracer(parent.id, arr);
  }

  return arr;
}

domTreeTracer(1);
domTreeTracer(2);
domTreeTracer(22);
