import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../providers/grade_provider.dart';
import '../providers/navigation_provider.dart';
import '../widgets/subject_empty_view.dart';
import '../widgets/subject_tile.dart';

// Displays all added subjects
class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeProvider>(
      builder: (context, provider, child) {
        if (!provider.hasSubjects) {
          return SubjectEmptyView(
            onAddSubject: context.read<NavigationProvider>().goToAddSubject,
          );
        }

        final theme = Theme.of(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.screenPadding.left,
                right: AppDimensions.screenPadding.right,
                top: AppDimensions.spacingXL,
                bottom: AppDimensions.spacingSM,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${provider.totalSubjects} subjects tracked',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacingXS),
                        Text(
                          AppStrings.swipeToDelete,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.65,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.auto_graph_rounded,
                    color: theme.colorScheme.primary,
                    size: AppDimensions.iconXL,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: AppDimensions.screenPadding,
                itemCount: provider.subjects.length,
                itemBuilder: (context, index) {
                  final subject = provider.subjects[index];

                  return Dismissible(
                    key: ValueKey('${subject.name}_${subject.mark}_$index'),
                    direction: DismissDirection.horizontal,
                    background: Container(
                      margin: const EdgeInsets.only(
                        bottom: AppDimensions.spacingMD,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.spacingLG,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusXL,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.delete_rounded,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                    secondaryBackground: Container(
                      margin: const EdgeInsets.only(
                        bottom: AppDimensions.spacingMD,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.spacingLG,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusXL,
                        ),
                      ),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete_rounded,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                    onDismissed: (_) {
                      provider.removeSubject(index);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.subjectDeletedSuccessfully),
                          action: SnackBarAction(
                            label: AppStrings.undo,
                            onPressed: () {
                              provider.addSubject(
                                name: subject.name,
                                mark: subject.mark,
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: SubjectTile(subject: subject),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
