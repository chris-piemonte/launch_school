interface UserData {
  name: string;
  age: number;
  email: string;
}

type PropertyNames = keyof UserData;

function printUserData(obj: UserData, key: PropertyNames): void {
  console.log(obj[key]);
}

const user: UserData = {
  name: 'Chris',
  age: 31,
  email: 'chris@email',
}

printUserData(user, 'name');
printUserData(user, 'email');
printUserData(user, 'error'); // example of argument that wouldn't work
