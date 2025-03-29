import 'package:fitness/core/theme_cubit/theme_cubit.dart';
import 'package:fitness/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/lib.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return AppTheme(
            data: AppThemeData(
              variant: AppThemeVariant.purple,
              themeMode: state,
            ),
            builder: (context, themeData, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: themeData.theme,
                darkTheme: themeData.darkTheme,
                themeMode: themeData.themeMode,
                routerConfig: router,
              );
            },
          );
        },
      ),
    );
  }
}
