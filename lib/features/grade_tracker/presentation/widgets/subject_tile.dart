import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../data/models/subject.dart';
import 'grade_chip.dart';

// Displays subject information inside the subject list
class SubjectTile extends StatelessWidget {
  final Subject subject;

  const SubjectTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingMD),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: AppDimensions.subjectTileMinHeight,
        ),
        padding: AppDimensions.cardPadding,
        child: Row(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
              ),
              child: Icon(
                Icons.menu_book_rounded,
                color: theme.colorScheme.primary,
                size: AppDimensions.iconLG,
              ),
            ),

            const SizedBox(width: AppDimensions.spacingMD),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subject.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingXS),

                  Text(
                    'Mark: ${subject.mark.toStringAsFixed(0)}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppDimensions.spacingMD),

            GradeChip(grade: subject.grade),
          ],
        ),
      ),
    );
  }
}
