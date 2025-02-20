function colorGeneration(ind) {
  let currentGen = [document.body];
  let nextGen = [];

  while (ind > 0) {
    currentGen.forEach(({children}) => {
      nextGen = nextGen.concat(Array.from(children));
    });

    currentGen = nextGen;
    nextGen = [];
    ind -= 1;
  }

  currentGen.forEach(({classList}) => classList.add('generation-color'));
}

colorGeneration(1);

colorGeneration(4);

