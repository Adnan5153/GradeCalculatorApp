import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';

// Displays a compact statistic card
class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatisticCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Container(
        height: AppDimensions.statisticsCardHeight,
        padding: AppDimensions.cardPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.spacingSM),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              ),
              child: Icon(
                icon,
                size: AppDimensions.iconMD,
                color: theme.colorScheme.primary,
              ),
            ),

            const Spacer(),

            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: AppDimensions.spacingXS),

            Text(
              title,
              style: theme.textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
