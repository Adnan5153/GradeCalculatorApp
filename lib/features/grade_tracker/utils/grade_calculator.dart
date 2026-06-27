import '../data/models/subject.dart';

// Utility class for grade calculations
class GradeCalculator {
  GradeCalculator._();

  // Calculate average mark
  static double calculateAverageMark(List<Subject> subjects) {
    if (subjects.isEmpty) {
      return 0;
    }

    final totalMarks = subjects.fold<double>(
      0,
      (sum, subject) => sum + subject.mark,
    );

    return totalMarks / subjects.length;
  }

  // Calculate overall grade based on average mark
  static String calculateOverallGrade(List<Subject> subjects) {
    final averageMark = calculateAverageMark(subjects);

    if (averageMark >= 80) {
      return 'A';
    }

    if (averageMark >= 65) {
      return 'B';
    }

    if (averageMark >= 50) {
      return 'C';
    }

    return 'F';
  }

  // Count passing subjects
  static int calculatePassingSubjects(List<Subject> subjects) {
    return subjects.where((subject) => subject.mark >= 50).length;
  }

  // Count failing subjects
  static int calculateFailingSubjects(List<Subject> subjects) {
    return subjects.where((subject) => subject.mark < 50).length;
  }

  // Find highest mark
  static double highestMark(List<Subject> subjects) {
    if (subjects.isEmpty) {
      return 0;
    }

    return subjects
        .map((subject) => subject.mark)
        .reduce((a, b) => a > b ? a : b);
  }

  // Find lowest mark
  static double lowestMark(List<Subject> subjects) {
    if (subjects.isEmpty) {
      return 0;
    }

    return subjects
        .map((subject) => subject.mark)
        .reduce((a, b) => a < b ? a : b);
  }

  // Determine whether all subjects are passed
  static bool allSubjectsPassed(List<Subject> subjects) {
    if (subjects.isEmpty) {
      return false;
    }

    return subjects.every((subject) => subject.mark >= 50);
  }
}
