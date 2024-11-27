let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function generateClassRecordSummary(scores) {
  let studentGrades = []
  let exams = []

  for (let student in scores ) {
    examStats(exams, scores[student]);

    let exam = studentExamsAverage(scores[student]);
    let exercises = studentExercisesTotal(scores[student]);
    studentGrades.push(Math.round(exam * .65 + exercises * .35));
  };

  const classRecordSummary = {}
  classRecordSummary.studentGrades = styleStudentGrades(studentGrades);
  classRecordSummary.exams = aggregateExamStats(exams);

  return classRecordSummary;
}

function aggregateExamStats(exams) {
  return exams.map(exam => {
    let average = exam.reduce((total, score) => total + score) / exam.length;
    let minimum = exam.reduce((min, score) => min < score ? min : score);
    let maximum = exam.reduce((max, score) => max > score ? max : score);
    return {average: average, minimum: minimum, maximum: maximum};
  });
}

function styleStudentGrades(grades) {
  return grades.map(percent => {
    if (percent >= 93) {
      return `${percent} (A)`;
    } else if (percent >= 85) {
      return `${percent} (B)`;
    } else if (percent >= 77) {
      return `${percent} (C)`;
    } else if (percent >= 69) {
      return `${percent} (D)`;
    } else {
      return `${percent} (F)`;
    }
  });
}

function examStats(tracker, student) {
  student.scores.exams.forEach((score, i) => {
    if (!tracker[i]) tracker[i] = [];
    tracker[i].push(score);
  });
}

function studentExamsAverage(student) {
 return student.scores.exams.reduce((total, score) => total + score) / 4;
}

function studentExercisesTotal(student) {
  return student.scores.exercises.reduce((total, score) => total + score)
}

console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }
