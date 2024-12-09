// Write a function called doubler that doubles every value in an array". We are not given any test cases, so we'll have to create them all on our own.

/*
- elements that are numbers should be multiplied by 2
- elements that are strings should be repeated twice via concatenation
- other types of elements should be duplicated in the array
- the input array should not be mutated
- elements that are special number values should remain unchanged
- elements that are any other type of number should be treated normally (multiplied by 2)
- elements that are empty strings should remain unchanged
- elements that are any other type of string should be treated normally (repeated twice)
- the input array can contain a mixture of different types of elements
- non-primitive elements should have their reference duplicated, not their value
- elements that appear more than once should be treated normally (as specified above)
- elements that contain nested arrays or objects should be treated normally (duplicated)
- if the input array contains empty slots (a "sparse array"), they should be removed
- if an inner array (element) contains empty slots, they should remain unchanged
- if the input array contains any object properties, they should remain unchanged
- if an inner array (element) contains any object properties, they should remain unchanged
- if the array is empty, return an empty array
- if multiple arguments are passed, ignore all but the first
- if the argument is a string, treat it as an array of characters
- if the argument is a non-negative integer, treat it as an array of digits
- if the argument is an object, treat it as an array of its property values
- all other kinds of inputs are invalid, and should return the string 'Invalid input'
*/

doubler([1, 2, 3]) === [2, 4, 6]
doubler([1, '2', 3]) === [2, '22', 6]
doubler([1, [1,2,3], 3]) === [2, [1,2,3], [1, 2, 3], 6 ]

let a = [1, 2, 3];
doubler(a);
console.log(a) === [1, 2, 3]

doubler([NaN, Infinity, -Infinity]) === [NaN, Infinity, -Infinity]

doubler([1.25, 2.5, 3.75]) === [2.5, 5, 7.5]

doubler([1, '', 3]) === [2, '', 6]

doubler([1, 2, 3]) === [2, 4, 6]

doubler(['^', ',', '$']) === ['^^', ',,', '$$']

doubler([[1, 2, 3]]) === [2, 4, 6]

let b = [1, 2, 3]
doubler([b])[1] === b // true

doubler([10, 10]) === [20, 20]

doubler([[[5]]]) === [[[5]][[5]]

doubler([1, 2, , , 3]) === [2, 4, 6]

doubler([1, [1,2, , 3], 3]) === [2, [1,2, , 3], [1,2, , 3], 6 ]

doubler(['a': 'test']) === ['a': 'test']

doubler([]) === []

doubler([1, 2, 3], [4, 5, 6]) === [2, 4, 6]

doubler('abc') === ['aa', 'bb', 'cc']

doubler(987) === [18, 16, 14]

doubler({a; 1, b: 2, c: 3}) === [2, 4, 6]

doubler() === 'Invalid input'
doubler(-5) === 'Invalid input'
doubler(.65) === 'Invalid input'
doubler(Infinity) === 'Invalid input'
doubler(NaN) === 'Invalid input'
doubler(true) === 'Invalid input'
doubler(false) === 'Invalid input'
doubler(null) === 'Invalid input'
