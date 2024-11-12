function cleanUp(string) {
  string = string.replace(/[^a-zA-Z]/g, ' ');
  return string.replace(/(\s)\1+/g, '$1');
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "
