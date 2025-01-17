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
      return this.courses;
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

let school = {
  students: [],

  addStudent(name, year) {
    let options = ['1st', '2nd', '3rd', '4th', '5th']

    if (options.includes(year)) {
      let student = createStudent(name, year);
      this.students.push(student);
      return student;
    } else {
      return 'invalid year';
    }
  },

  enrollStudent(student, courseName, courseCode) {
    student.addCourse({name: courseName, code: courseCode});
  },

  addGrade(student, courseName, grade) {
    let course = student.listCourses().filter(({name}) => name === courseName)[0];
    if (course) course.grade = grade;
  },

  getReportCard(student) {
    for (let course of student.listCourses()) {
      console.log(`${course.name}: ${course.grade || 'In progress'}`);
    }
  },

  courseReport(course) {
    console.log(`=${course} Grades=`);
    let grades = [];

    let students = this.students.filter(({courses}) => {
      return courses.some(subject => subject.name === course);
    });

    students.forEach(student => {
      let subject = student.courses.filter(({name}) => name === course)[0];
      if (subject.grade) {
        grades.push(subject.grade);
        console.log(`${student.name}: ${subject.grade}`);
      }
    });

    console.log('---');
    console.log(`Course Average: ${grades.reduce((sum, num) => sum + num) / grades.length}`);
  },
};

let rachel = school.addStudent('Rachel', '1st')
let chris = school.addStudent('Chris', '5th')
let swathi = school.addStudent('swathi', '3rd')

school.enrollStudent(rachel, 'Math', 101);
school.enrollStudent(chris, 'Math', 101);
school.enrollStudent(swathi, 'Math', 101);

school.addGrade(rachel, 'Math', 79);
school.addGrade(chris, 'Math', 101);

school.courseReport('Math');

school.getReportCard(swathi);

// console.log(rachel);
// console.log(chris);
