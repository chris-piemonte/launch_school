// async function asyncDownloadFile() {
//     console.log("Downloading file...");
//     const message = await new Promise((resolve) => {
//     setTimeout(() => {
//       resolve("Download complete!");
//     }, 1500);
//   });
//   console.log(message);
// }

// asyncDownloadFile();

// async function loadData() {
//   try {
//     const message = await new Promise((resolve, reject) => {
//       setTimeout(() => {
//         if (Math.random() > 0.5) {
//           resolve("Data loaded");
//         } else {
//           reject("Network error");
//         }
//       }, 1000);
//     });
//     console.log(message);
//   } catch (error) {
//     console.error(error);
//   }
// }

// loadData();

// async function fetchResource(url) {
//   try {
//     const response = await fetch(url);
//     const data = await response.json();
//     console.log(data);
//   } catch (error) {
//     console.error("Failed to load resource");
//   } finally {
//     console.log("Resource fetch attempt made");
//   }
// }

// // Example usage:
// fetchResource("https://jsonplaceholder.typicode.com/todos/1");
// // Logs fetched data, then "Resource fetch attempt made"
// fetchResource("invalidUrl");
// // Logs "Failed to load resource", then "Resource fetch attempt made"

async function fetchUserProfile(userId) {
  try {
    const userProfile = await fetch(`https://jsonplaceholder.typicode.com/users/${userId}`).then(res => res.json());
    console.log("User Profile", userProfile);
  } catch (error) {
    console.error("Error fetching profile:", error);
  }

  try {
    const userPosts = await fetch(`https://jsonplaceholder.typicode.com/users/${userId}/posts`).then(res => res.json());
    console.log("User Profile", userPosts);
  } catch (error) {
    console.error("Error fetching profile:", error);
  }

  try {
    const userTodos = await fetch( `https://jsonplaceholder.typicode.com/users/${userId}/todos`).then(res => res.json());
    console.log("User Todos", userTodos);
  } catch (error) {
    console.error("Error fetching profile:", error);
  }
}

// Example usage:
fetchUserProfile(1);
// Logs user profile, posts, and todos. Catches and logs errors at each step if they occur.
