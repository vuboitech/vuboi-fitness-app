import 'package:fitness/router.dart';
import 'package:fitness/theme/variant.dart';
import 'package:flutter/material.dart';

import 'theme/theme_widgets/inherited_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: const AppThemeData(
        variant: AppThemeVariant.purple,
        themeMode: ThemeMode.system,
      ),
      builder: (context, themeData, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeData.theme,
          routerConfig: router,
        );
      },
    );
  }
}
