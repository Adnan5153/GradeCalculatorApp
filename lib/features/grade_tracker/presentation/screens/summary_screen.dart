import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/asset_paths.dart';
import '../providers/grade_provider.dart';
import '../providers/navigation_provider.dart';
import '../widgets/summary_metrics_grid.dart';

// Displays academic performance summary
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<GradeProvider>(
      builder: (context, provider, child) {
        if (!provider.hasSubjects) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AssetPaths.schoolAnimation,
                    height: AppDimensions.lottieLarge,
                    repeat: true,
                  ),

                  const SizedBox(height: AppDimensions.spacingLG),

                  Text(
                    AppStrings.noSummaryAvailable,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingMD),

                  Text(
                    AppStrings.noSummaryDescription,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingXL),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<NavigationProvider>().goToAddSubject();
                      },
                      icon: const Icon(Icons.add_rounded),
                      label: const Text(AppStrings.addSubjectButton),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.spacingMD,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusLG,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Lottie.asset(
                  AssetPaths.graduationAnimation,
                  height: AppDimensions.lottieLarge,
                  repeat: true,
                ),
              ),

              const SizedBox(height: AppDimensions.spacingLG),

              Text(
                AppStrings.academicSummary,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: AppDimensions.spacingSM),

              Text(
                AppStrings.summaryDescription,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),

              const SizedBox(height: AppDimensions.spacingXL),

              const SummaryMetricsGrid(),

              const SizedBox(height: AppDimensions.spacingXL),

              Container(
                width: double.infinity,
                padding: AppDimensions.cardPadding,
                decoration: BoxDecoration(
                  gradient: AppColors.summaryGradient,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      size: AppDimensions.iconXL,
                      color: theme.colorScheme.onPrimary,
                    ),

                    const SizedBox(height: AppDimensions.spacingMD),

                    Text(
                      AppStrings.overallPerformance,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: AppDimensions.spacingSM),

                    Text(
                      provider.overallGrade,
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: AppDimensions.spacingSM),

                    Text(
                      _getPerformanceMessage(provider.overallGrade),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onPrimary.withValues(
                          alpha: 0.9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppDimensions.spacingXL),

              Card(
                child: Padding(
                  padding: AppDimensions.cardPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.academicInsights,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: AppDimensions.spacingLG),

                      _InsightTile(
                        icon: Icons.menu_book_rounded,
                        title: AppStrings.totalSubjects,
                        value: provider.totalSubjects.toString(),
                      ),

                      _InsightTile(
                        icon: Icons.check_circle_rounded,
                        title: AppStrings.passingSubjects,
                        value: provider.passingSubjects.toString(),
                      ),

                      _InsightTile(
                        icon: Icons.cancel_rounded,
                        title: AppStrings.failingSubjects,
                        value: provider.failingSubjects.toString(),
                      ),

                      _InsightTile(
                        icon: Icons.analytics_rounded,
                        title: AppStrings.averageMark,
                        value: provider.averageMark.toStringAsFixed(1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getPerformanceMessage(String grade) {
    switch (grade) {
      case 'A':
        return 'Outstanding academic performance. Keep up the excellent work.';

      case 'B':
        return 'Very good progress with strong academic results.';

      case 'C':
        return 'Satisfactory performance with room for improvement.';

      default:
        return 'Focus on improving your results and achieving your goals.';
    }
  }
}

// Displays a summary insight item
class _InsightTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InsightTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingMD),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(width: AppDimensions.spacingMD),
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
