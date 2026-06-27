import 'package:flutter/material.dart';

import '../../data/models/subject.dart';
import '../../utils/grade_calculator.dart';

// Manage subject data and grade statistics
class GradeProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => List.unmodifiable(_subjects);

  int get totalSubjects => _subjects.length;

  bool get hasSubjects => _subjects.isNotEmpty;

  // Add a new subject
  void addSubject({required String name, required double mark}) {
    final subject = Subject(name: name.trim(), mark: mark);

    _subjects.add(subject);
    notifyListeners();
  }

  // Remove subject by index
  void removeSubject(int index) {
    if (index < 0 || index >= _subjects.length) {
      return;
    }

    _subjects.removeAt(index);
    notifyListeners();
  }

  // Remove a specific subject
  void removeSubjectByObject(Subject subject) {
    _subjects.remove(subject);
    notifyListeners();
  }

  // Clear all subjects
  void clearSubjects() {
    _subjects.clear();
    notifyListeners();
  }

  // Average mark
  double get averageMark => GradeCalculator.calculateAverageMark(_subjects);

  // Overall grade
  String get overallGrade => GradeCalculator.calculateOverallGrade(_subjects);

  // Passing subjects
  int get passingSubjects =>
      GradeCalculator.calculatePassingSubjects(_subjects);

  // Failing subjects
  int get failingSubjects =>
      GradeCalculator.calculateFailingSubjects(_subjects);

  // Highest mark
  double get highestMark => GradeCalculator.highestMark(_subjects);

  // Lowest mark
  double get lowestMark => GradeCalculator.lowestMark(_subjects);

  // Whether every subject is passed
  bool get allSubjectsPassed => GradeCalculator.allSubjectsPassed(_subjects);

  // Explicit assignment requirement using map()
  List<String> get subjectNames =>
      _subjects.map((subject) => subject.name).toList();

  // Explicit assignment requirement using where()
  List<Subject> get passedSubjects =>
      _subjects.where((subject) => subject.mark >= 50).toList();

  // Explicit assignment requirement using where()
  List<Subject> get failedSubjects =>
      _subjects.where((subject) => subject.mark < 50).toList();
}
