import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:gradcal/core/constants/app_strings.dart';
import 'package:gradcal/features/grade_tracker/presentation/providers/grade_provider.dart';
import 'package:gradcal/features/grade_tracker/presentation/providers/theme_provider.dart';
import 'package:gradcal/features/grade_tracker/presentation/screens/summary_screen.dart';

void main() {
  testWidgets('summary screen renders within a constrained viewport', (
    WidgetTester tester,
  ) async {
    final gradeProvider = GradeProvider();
    gradeProvider.addSubject(name: 'Mathematics', mark: 82);
    gradeProvider.addSubject(name: 'Science', mark: 74);

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: gradeProvider,
        child: const MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(width: 320, height: 600, child: SummaryScreen()),
            ),
          ),
        ),
      ),
    );

    expect(find.text(AppStrings.academicSummary), findsOneWidget);
    expect(find.text(AppStrings.academicInsights), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('toggling theme does not throw text style interpolation errors', (
    WidgetTester tester,
  ) async {
    final themeProvider = ThemeProvider();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: themeProvider,
        child: const MaterialApp(home: Scaffold(body: SummaryScreen())),
      ),
    );

    themeProvider.toggleTheme();
    await tester.pump();

    themeProvider.toggleTheme();
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}
