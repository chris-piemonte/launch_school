function star(n) {
  let outsideSpaces = 0;
  let insideSpaces = ((n - 3) / 2);

  for (let row = 1; row <= n; row += 1) {
    if (row === Math.ceil(n / 2)) {
      console.log('*'.repeat(n));
      continue;
    }

    string = ' '.repeat(outsideSpaces) + '*' + ' '.repeat(insideSpaces) + '*' + ' '.repeat(insideSpaces) + '*' + ' '.repeat(outsideSpaces);
    console.log(string);

    if (row < Math.floor(n / 2)) {
      outsideSpaces += 1;
      insideSpaces -=1;
    }

    if (row > Math.ceil(n / 2)) {
      outsideSpaces -= 1;
      insideSpaces +=1;
    }
  }
}

star(7);
// logs
// *  *  *
//  * * *
//   ***
// *******
//   ***
//  * * *
// *  *  *

star(9);
// logs
// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *

star(101);
