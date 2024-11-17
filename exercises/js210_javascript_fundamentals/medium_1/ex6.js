function debugIt() {
  const status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

// It logs 'debugging' because `logger()` is declared at the same scope level as `status` so `status` is part of `logger()`'s closure
