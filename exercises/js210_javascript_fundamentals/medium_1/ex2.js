let i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

// no, it create an infinite loop because it doesn't iterate i when (i % 3 === 0) is true.
