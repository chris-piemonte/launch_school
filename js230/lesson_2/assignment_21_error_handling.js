// function flakyService() {
//   return new Promise((resolve, reject) => {
//     if (Math.random() > 0.5) {
//       resolve("Operation successful");
//     } else {
//       reject();
//     }
//   });
// }

// flakyService().then(console.log).catch(() => console.error("An error occured"));

// function fetchUserData() {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => reject({ error: "User not found" }), 500);
//   });
// }

// fetchUserData().catch((obj) => console.error(obj.error)).finally(() => console.log("Fetching complete"));

// function retryOperation(operationFunc) {
//   let tries = 0;

//   function attempt() {
//     return operationFunc().catch((error) => {
//       if (tries < 2) {
//         tries += 1;
//         console.log(`Retry attempt ${tries}`);
//         return attempt();
//       } else {
//         throw error;
//       }
//     });
//   }

//   return attempt().catch(() => console.error("Operation failed"));
// }

// // Example usage:
// retryOperation(
//   () =>
//     new Promise((resolve, reject) =>
//       Math.random() > 0.5
//         ? resolve("Success!")
//         : reject(new Error("Fail!"))
//     )
// );

// function mockAsyncOp() {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => {
//       if (Math.random() > 0.5) {
//         resolve("Operation succeeded");
//       } else {
//         reject("Operation failed");
//       }
//     }, 1000);
//   });
// }

// mockAsyncOp().then(console.log).catch(console.error).finally(() => console.log("Operation attempted"));

function loadData() {
  return new Promise((resolve, reject) => {
    if (Math.random() > .5) {
      resolve("Data loaded");
    } else {
      reject("Network error");
    }
  }).catch(() => Promise.resolve("Using cached data"));
}

loadData().then(console.log);
