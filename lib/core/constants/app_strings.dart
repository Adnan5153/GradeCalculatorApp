// Application Text Constants
class AppStrings {
  AppStrings._();

  // App
  static const String appName = 'Student Grade Tracker';
  static const String appTagline = 'Track, Analyze, and Improve Performance';

  // Navigation
  static const String addSubject = 'Add Subject';
  static const String subjectList = 'Subject List';
  static const String summary = 'Summary';

  // Add Subject Screen
  static const String addNewSubject = 'Add New Subject';
  static const String subjectName = 'Subject Name';
  static const String subjectNameHint = 'Enter subject name';

  static const String marks = 'Marks';
  static const String marksHint = 'Enter marks (0 - 100)';

  static const String addSubjectButton = 'Add Subject';

  // Validation Messages
  static const String subjectNameRequired = 'Please enter a subject name';

  static const String marksRequired = 'Please enter subject marks';

  static const String invalidNumber = 'Please enter a valid number';

  static const String invalidMarksRange = 'Marks must be between 0 and 100';

  // Success Messages
  static const String subjectAddedSuccessfully = 'Subject added successfully';

  static const String subjectDeletedSuccessfully =
      'Subject removed successfully';

  static const String undo = 'Undo';

  // Subject List Screen
  static const String subjects = 'Subjects';
  static const String mark = 'Mark';
  static const String grade = 'Grade';

  static const String swipeToDelete = 'Swipe left or right to delete';

  static const String noSubjectsFound = 'No subjects added yet';

  static const String noSubjectsDescription =
      'Start by adding your first subject to track grades and performance.';

  static const String addSubjectDescription =
      'Enter a subject name and marks to track academic performance and calculate grades automatically.';

  // Summary Screen
  static const String academicSummary = 'Academic Summary';

  static const String totalSubjects = 'Total Subjects';

  static const String averageMark = 'Average Mark';

  static const String overallGrade = 'Overall Grade';

  static const String passingSubjects = 'Passing Subjects';

  static const String failingSubjects = 'Failing Subjects';

  static const String noSummaryAvailable = 'No summary available';

  static const String noSummaryDescription =
      'Add subjects to generate performance statistics.';

  // Grades
  static const String gradeA = 'A';
  static const String gradeB = 'B';
  static const String gradeC = 'C';
  static const String gradeF = 'F';

  // Theme
  static const String lightMode = 'Light Mode';
  static const String darkMode = 'Dark Mode';

  // Dialogs
  static const String deleteSubject = 'Delete Subject';
  static const String confirmDelete =
      'Are you sure you want to remove this subject?';

  static const String cancel = 'Cancel';
  static const String delete = 'Delete';

  // Empty States
  static const String emptyStateTitle = 'Nothing Here Yet';

  static const String emptyStateSubtitle =
      'Add subjects to begin tracking academic performance.';

  // Statistics Labels
  static const String excellentPerformance = 'Excellent Performance';

  static const String goodPerformance = 'Good Performance';

  static const String averagePerformance = 'Average Performance';

  static const String needsImprovement = 'Needs Improvement';

  // Lottie Labels
  static const String loading = 'Loading...';

  static const String success = 'Success';

  // Tooltips
  static const String themeToggleTooltip = 'Switch Theme';

  static const String deleteTooltip = 'Delete Subject';

  static const String summaryDescription =
      'Monitor academic performance through real-time analytics and grade insights.';

  static const String overallPerformance = 'Overall Performance';

  static const String academicInsights = 'Academic Insights';
}
