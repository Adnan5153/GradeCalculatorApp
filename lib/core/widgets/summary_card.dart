import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

// Premium summary/statistics card
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Gradient gradient;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: AppDimensions.summaryCardHeight,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.08),
              ),
            ),
          ),

          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.05),
              ),
            ),
          ),

          Container(
            padding: AppDimensions.cardPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
              border: Border.all(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
                  ),
                  child: Icon(
                    icon,
                    color: theme.colorScheme.onPrimary,
                    size: AppDimensions.iconLG,
                  ),
                ),

                const Spacer(),

                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: AppDimensions.spacingXS),

                Text(
                  title.toUpperCase(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.85),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
