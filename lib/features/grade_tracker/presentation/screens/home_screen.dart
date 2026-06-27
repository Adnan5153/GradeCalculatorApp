import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../providers/navigation_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

// Main application shell with bottom navigation
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Widget> _screens = [
    AddSubjectScreen(),
    SubjectListScreen(),
    SummaryScreen(),
  ];

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return AppStrings.addSubject;

      case 1:
        return AppStrings.subjectList;

      case 2:
        return AppStrings.summary;

      default:
        return AppStrings.appName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        final theme = Theme.of(context);

        return Scaffold(
          appBar: CustomAppBar(
            title: _getTitle(navigationProvider.currentIndex),
          ),

          body: AnimatedSwitcher(
            duration: AppDimensions.normalAnimation,
            child: IndexedStack(
              key: ValueKey(navigationProvider.currentIndex),
              index: navigationProvider.currentIndex,
              children: _screens,
            ),
          ),

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingMD,
              vertical: AppDimensions.spacingSM,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusXXL),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: theme.colorScheme.primary.withOpacity(0.12),
                  labelTextStyle: MaterialStateProperty.all(
                    theme.textTheme.labelMedium,
                  ),
                ),
                child: NavigationBar(
                  height: AppDimensions.buttonHeight,
                  selectedIndex: navigationProvider.currentIndex,
                  onDestinationSelected: navigationProvider.changeIndex,
                  elevation: AppDimensions.elevationSM,
                  backgroundColor: theme.colorScheme.surface,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.add_circle_outline_rounded),
                      selectedIcon: Icon(Icons.add_circle_rounded),
                      label: AppStrings.addSubject,
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.menu_book_outlined),
                      selectedIcon: Icon(Icons.menu_book_rounded),
                      label: AppStrings.subjectList,
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.analytics_outlined),
                      selectedIcon: Icon(Icons.analytics_rounded),
                      label: AppStrings.summary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
