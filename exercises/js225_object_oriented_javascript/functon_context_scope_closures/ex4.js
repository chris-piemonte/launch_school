function myBind(func, context) {
  return () => {
    return func.call(context);
  }
}
