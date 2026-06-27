import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_dimensions.dart';

// Premium reusable empty state widget
class EmptyStateWidget extends StatelessWidget {
  final String animationPath;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onPressed;

  const EmptyStateWidget({
    super.key,
    required this.animationPath,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimensions.spacingXL),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: 0.15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                animationPath,
                height: AppDimensions.lottieLarge,
                repeat: true,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: AppDimensions.lottieLarge,
                    width: AppDimensions.lottieLarge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    ),
                    child: Icon(
                      Icons.school_rounded,
                      size: AppDimensions.iconXL,
                      color: theme.colorScheme.primary,
                    ),
                  );
                },
              ),

              const SizedBox(height: AppDimensions.spacingLG),

              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: AppDimensions.spacingSM),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    height: 1.5,
                  ),
                ),
              ),

              if (buttonText != null && onPressed != null) ...[
                const SizedBox(height: AppDimensions.spacingXL),
                SizedBox(
                  width: 220,
                  child: ElevatedButton.icon(
                    onPressed: onPressed,
                    icon: const Icon(Icons.add_rounded),
                    label: Text(buttonText!),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
