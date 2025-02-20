interface Dog {
  bark(): void;
}

interface Cat {
  meow(): void;
}

type Pet = Dog & Cat

let pet: Pet = {
  bark(): void {
    console.log("Woof");
  },

  meow: () => console.log("Meow"),
}

pet.bark();
pet.meow();
