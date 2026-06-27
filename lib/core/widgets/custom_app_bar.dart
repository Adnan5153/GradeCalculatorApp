import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/grade_tracker/presentation/providers/theme_provider.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';

// Reusable premium application app bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      leading: leading,
      elevation: 0,
      centerTitle: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: theme.dividerColor.withValues(alpha: 0.15),
        ),
      ),

      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),

          if (subtitle != null)
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ),
        ],
      ),

      actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Padding(
              padding: const EdgeInsets.only(right: AppDimensions.spacingMD),
              child: Material(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                  onTap: themeProvider.toggleTheme,
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusXL,
                      ),
                      border: Border.all(
                        color: theme.dividerColor.withValues(alpha: 0.25),
                      ),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) {
                        return RotationTransition(
                          turns: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Icon(
                        themeProvider.isDarkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        key: ValueKey(themeProvider.isDarkMode),
                        color: theme.colorScheme.primary,
                        size: AppDimensions.iconMD,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
