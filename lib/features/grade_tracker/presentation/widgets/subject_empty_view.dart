import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/asset_paths.dart';

// Displays a premium empty state for the subject list
class SubjectEmptyView extends StatelessWidget {
  final VoidCallback onAddSubject;

  const SubjectEmptyView({super.key, required this.onAddSubject});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: AppDimensions.lottieLarge + 40,
              width: AppDimensions.lottieLarge + 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.25),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingLG),
                child: Lottie.asset(AssetPaths.schoolAnimation, repeat: true),
              ),
            ),

            const SizedBox(height: AppDimensions.spacingXL),

            Container(
              width: double.infinity,
              padding: AppDimensions.cardPadding,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.15),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingLG,
                      vertical: AppDimensions.spacingSM,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.achievementGradient,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusCircular,
                      ),
                    ),
                    child: Text(
                      'READY TO TRACK',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingLG),

                  Text(
                    AppStrings.noSubjectsFound,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingMD),

                  Text(
                    AppStrings.noSubjectsDescription,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingXL),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onAddSubject,
                      icon: const Icon(Icons.add_rounded),
                      label: const Text(AppStrings.addSubjectButton),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusLG,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.spacingMD,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingXL),

                  Row(
                    children: [
                      Expanded(
                        child: _InfoBadge(
                          icon: Icons.auto_graph_rounded,
                          label: 'Track',
                        ),
                      ),
                      const SizedBox(width: AppDimensions.spacingMD),
                      Expanded(
                        child: _InfoBadge(
                          icon: Icons.analytics_rounded,
                          label: 'Analyze',
                        ),
                      ),
                      const SizedBox(width: AppDimensions.spacingMD),
                      Expanded(
                        child: _InfoBadge(
                          icon: Icons.workspace_premium_rounded,
                          label: 'Achieve',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Decorative feature badge
class _InfoBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.spacingMD),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
      ),
      child: Column(
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(height: AppDimensions.spacingSM),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
