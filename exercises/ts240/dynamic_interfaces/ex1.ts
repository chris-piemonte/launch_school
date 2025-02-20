interface Person {
  name: string;
  age: number;
}

interface Employee extends Person {
  employeeId: number;
}

let employee: Employee = {
  name: 'Chris',
  age: 31,
  employeeId: 1,
}

console.log(employee);
