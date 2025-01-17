function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],
    notes: {},

    info() {
      console.log(`${this.name} is a ${this.year} year student`);
    },

    addCourse(course) {
      this.courses.push(course);
    },

    listCourses() {
      console.log(this.courses);
    },

    addNote(code, note) {
      let subject;
      this.courses.forEach(course => {
        if (course.code === code) subject = course
      });

      if (!this.notes[subject.name]) this.notes[subject.name] = [];
      this.notes[subject.name].push(note);
    },

    updateNote(code, note) {
      let subject;
      this.courses.forEach(course => {
        if (course.code === code) subject = course
      });

      this.notes[subject.name] = [note];
    },

    viewNotes() {
      for (let course in this.notes) {
        console.log(`${course}: ${this.notes[course].join('; ')}`);
      }
    },
  };
}

let foo = createStudent('Foo', '1st');
foo.info();
// "Foo is a 1st year student"
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advance Math: Difficult subject"
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// "Math: Fun course"
// "Advanced Math: Difficult subject"
