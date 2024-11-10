// function logOddNumbers(num) {
//   for (let i = 1; i <= num; i+=2) {
//     console.log(i);
//   }
// }


function logOddNumbers(num) {
  for (let i = 1; i <= num; i+=1) {
    if (i % 2 === 0) continue
    console.log(i);
  }
}

logOddNumbers(19);
