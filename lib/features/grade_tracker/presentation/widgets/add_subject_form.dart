import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/asset_paths.dart';
import '../providers/grade_provider.dart';

// Form for adding a new subject
class AddSubjectForm extends StatefulWidget {
  const AddSubjectForm({super.key});

  @override
  State<AddSubjectForm> createState() => _AddSubjectFormState();
}

class _AddSubjectFormState extends State<AddSubjectForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _subjectController = TextEditingController();

  final TextEditingController _marksController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _marksController.dispose();
    super.dispose();
  }

  // Submit subject data
  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();
    final provider = context.read<GradeProvider>();

    provider.addSubject(
      name: _subjectController.text,
      mark: double.parse(_marksController.text),
    );

    _subjectController.clear();
    _marksController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(AppStrings.subjectAddedSuccessfully),
        duration: AppDimensions.successDuration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Validate subject name
  String? _validateSubjectName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.subjectNameRequired;
    }

    return null;
  }

  // Validate marks
  String? _validateMarks(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.marksRequired;
    }

    final mark = double.tryParse(value);

    if (mark == null) {
      return AppStrings.invalidNumber;
    }

    if (mark < 0 || mark > 100) {
      return AppStrings.invalidMarksRange;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _subjectController,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: AppStrings.subjectName,
              hintText: AppStrings.subjectNameHint,
              prefixIcon: Icon(Icons.menu_book_rounded),
            ),
            validator: _validateSubjectName,
          ),

          TextFormField(
            controller: _marksController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: AppStrings.marks,
              hintText: AppStrings.marksHint,
              prefixIcon: Icon(Icons.score_rounded),
              suffixText: '/100',
            ),
            validator: _validateMarks,
            onFieldSubmitted: (_) {
              _submitForm();
            },
          ),

          const SizedBox(height: AppDimensions.spacingXL),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _submitForm,
              icon: const Icon(Icons.add_rounded),
              label: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.spacingSM,
                ),
                child: Text(AppStrings.addSubjectButton),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
