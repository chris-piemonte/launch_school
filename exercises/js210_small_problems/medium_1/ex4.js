function minilang(string) {
  let actions = string.match(/\S+/g);
  let stack = []
  let register = 0

  actions.forEach(word => {
    switch (word) {
      case 'PUSH':
        stack.push(register);
        break;
      case 'ADD':
        if (stack.length === 0) return console.log('stack is empty');
        register += stack.pop();
        break;
      case 'SUB':
        if (stack.length === 0) return console.log('stack is empty');
        register -= stack.pop();
        break;
      case 'MULT':
        if (stack.length === 0) return console.log('stack is empty');
        register *= stack.pop();
        break;
      case 'DIV':
        if (stack.length === 0) return console.log('stack is empty');
        register = Math.floor(register / stack.pop());
        break;
      case 'REMAINDER':
        if (stack.length === 0) return console.log('stack is empty');
        register %= stack.pop();
        break;
      case 'POP':
        if (stack.length === 0) return console.log('stack is empty');
        register = stack.pop();
        break;
      case 'PRINT':
        console.log(register);
        break;
      default:
        // if (/[^\-?\d+]/.test(word)) {
        if (Number.isNaN(Number(word))) {
          return console.log('invalid token');
        }
        register = Number(word);
    }
  });
}

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
//5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)

minilang('sdgse');

minilang('-3 PUSH 55 SUB PRINT');
