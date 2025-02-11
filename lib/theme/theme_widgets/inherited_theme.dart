import 'package:flutter/material.dart';

import '../variant.dart';

class AppTheme extends StatefulWidget {
  final ValueWidgetBuilder<AppThemeData>? builder;
  final Widget? child;
  final AppThemeData data;

  const AppTheme({
    super.key,
    this.builder,
    this.child,
    this.data = const AppThemeData(),
  }) : assert(
          builder != null || child != null,
          'Either builder or child must be provided',
        );

  static AppThemeData of(BuildContext context) => maybeOf(context)!;

  static AppThemeData? maybeOf(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<_AppInheritedTheme>();
    return theme?.data;
  }

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  AppThemeVariant? _variant;

  ThemeMode resolveMode() {
    final mode = widget.data.themeMode ?? ThemeMode.system;
    if (mode == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    }
    return mode;
  }

  AppThemeData resolveData() {
    return widget.data.copyWith(
      variant: widget.data.variant ?? _variant,
      themeMode: resolveMode(),
    );
  }

  ThemeData resolveTheme(AppThemeData data) {
    final dark = data.themeMode == ThemeMode.dark;

    final variant = data.variant ?? AppThemeVariant.purple;
    return (dark ? variant.darkTheme : variant.theme).overrideWith(data);
  }

  @override
  Widget build(BuildContext context) {
    final data = resolveData();
    return _AppInheritedTheme(
      data: data,
      child: widget.builder?.call(context, data, widget.child) ??
          AnimatedTheme(
            data: resolveTheme(data),
            child: widget.child!,
          ),
    );
  }
}

@immutable
class AppThemeData {
  final AppThemeVariant? variant;
  final ThemeMode? themeMode;
  final Iterable<ThemeExtension<dynamic>>? extensions;
  final bool? useMaterial3;

  const AppThemeData({
    this.variant = AppThemeVariant.purple,
    this.themeMode,
    this.extensions,
    this.useMaterial3,
  });

  ThemeData get theme => (variant?.theme)!.overrideWith(this);

  ThemeData get darkTheme => (variant?.darkTheme)!.overrideWith(this);

  AppThemeData copyWith({
    AppThemeVariant? variant,
    bool? highContrast,
    ThemeMode? themeMode,
    Iterable<ThemeExtension<dynamic>>? extensions,
    PageTransitionsTheme? pageTransitionsTheme,
    bool? useMaterial3,
    VisualDensity? visualDensity,
  }) {
    return AppThemeData(
      variant: variant ?? this.variant,
      themeMode: themeMode ?? this.themeMode,
      extensions: extensions ?? this.extensions,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
    );
  }
}

class _AppInheritedTheme extends InheritedTheme {
  const _AppInheritedTheme({
    required this.data,
    required super.child,
  });

  final AppThemeData? data;

  @override
  bool updateShouldNotify(covariant _AppInheritedTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _AppInheritedTheme(data: data, child: child);
  }
}

extension _AppThemeDataX on ThemeData {
  ThemeData overrideWith(AppThemeData data) {
    return copyWith(
      extensions: data.extensions,
    );
  }
}
