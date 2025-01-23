function newStack() {
  const stack = [];

  return {
    push(ele) {
      stack.push(ele);
    },

    pop() {
      return stack.pop();
    },

    printStack() {
      stack.forEach(ele => console.log(ele));
    },
  };
}
