import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/summary_card.dart';
import '../providers/grade_provider.dart';

// Displays all summary metrics in a dashboard grid
class SummaryMetricsGrid extends StatelessWidget {
  const SummaryMetricsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeProvider>(
      builder: (context, provider, child) {
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: AppDimensions.spacingMD,
          mainAxisSpacing: AppDimensions.spacingMD,
          childAspectRatio: 1.1,
          children: [
            SummaryCard(
              title: AppStrings.totalSubjects,
              value: provider.totalSubjects.toString(),
              icon: Icons.menu_book_rounded,
              gradient: AppColors.primaryGradient,
            ),

            SummaryCard(
              title: AppStrings.averageMark,
              value: provider.averageMark.toStringAsFixed(1),
              icon: Icons.analytics_rounded,
              gradient: AppColors.successGradient,
            ),

            SummaryCard(
              title: AppStrings.overallGrade,
              value: provider.overallGrade,
              icon: Icons.workspace_premium_rounded,
              gradient: AppColors.achievementGradient,
            ),

            SummaryCard(
              title: AppStrings.passingSubjects,
              value: provider.passingSubjects.toString(),
              icon: Icons.check_circle_rounded,
              gradient: AppColors.summaryGradient,
            ),
          ],
        );
      },
    );
  }
}
