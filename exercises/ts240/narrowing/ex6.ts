function logUnknown(param: unknown): void {
  if (typeof param === 'string') {
    console.log(param);
  }
}

logUnknown('test');
logUnknown(true);
