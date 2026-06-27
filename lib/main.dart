import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'features/grade_tracker/presentation/providers/grade_provider.dart';
import 'features/grade_tracker/presentation/providers/navigation_provider.dart';
import 'features/grade_tracker/presentation/providers/theme_provider.dart';

// Application entry point
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),

        ChangeNotifierProvider(create: (_) => GradeProvider()),

        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const App(),
    ),
  );
}
