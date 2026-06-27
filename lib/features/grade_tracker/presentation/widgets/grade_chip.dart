import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

// Displays a grade badge
class GradeChip extends StatelessWidget {
  final String grade;

  const GradeChip({super.key, required this.grade});

  Color _getGradeColor() {
    switch (grade) {
      case 'A':
        return AppColors.gradeA;

      case 'B':
        return AppColors.gradeB;

      case 'C':
        return AppColors.gradeC;

      default:
        return AppColors.gradeF;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getGradeColor();
    final theme = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(minWidth: 48),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMD,
        vertical: AppDimensions.spacingSM,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppDimensions.radiusCircular),
        border: Border.all(color: color),
      ),
      child: Text(
        grade,
        textAlign: TextAlign.center,
        style: theme.textTheme.labelLarge?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
