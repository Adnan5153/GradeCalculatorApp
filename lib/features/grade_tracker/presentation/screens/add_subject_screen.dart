import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/asset_paths.dart';
import '../widgets/add_subject_form.dart';

// Screen for adding new subjects
class AddSubjectScreen extends StatelessWidget {
  const AddSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: AppDimensions.cardPadding,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.15),
                ),
              ),
              child: Column(
                children: [
                  Lottie.asset(
                    AssetPaths.schoolAnimation,
                    height: AppDimensions.lottieMedium,
                    repeat: true,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: AppDimensions.lottieMedium,
                        child: Icon(
                          Icons.school_rounded,
                          size: 80,
                          color: theme.colorScheme.primary,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: AppDimensions.spacingMD),

                  Text(
                    AppStrings.addNewSubject,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacingSM),

                  Text(
                    AppStrings.addSubjectDescription,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppDimensions.spacingXL),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
              ),
              child: const AddSubjectForm(),
            ),
          ],
        ),
      ),
    );
  }
}
