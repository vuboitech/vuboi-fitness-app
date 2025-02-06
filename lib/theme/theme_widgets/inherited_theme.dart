import 'package:flutter/material.dart';

import '../variant.dart';

class AppTheme extends StatefulWidget {
  final ValueWidgetBuilder<EquatorThemeData>? builder;
  final Widget? child;
  final EquatorThemeData data;

  const AppTheme({
    super.key,
    this.builder,
    this.child,
    this.data = const EquatorThemeData(),
  }) : assert(
          builder != null || child != null,
          'Either builder or child must be provided',
        );

  static EquatorThemeData of(BuildContext context) => maybeOf(context)!;

  static EquatorThemeData? maybeOf(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<_EquatorInheritedTheme>();
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

  EquatorThemeData resolveData() {
    return widget.data.copyWith(
      variant: widget.data.variant ?? _variant,
      themeMode: resolveMode(),
    );
  }

  ThemeData resolveTheme(EquatorThemeData data) {
    final dark = data.themeMode == ThemeMode.dark;

    final variant = data.variant ?? AppThemeVariant.purple;
    return (dark ? variant.darkTheme : variant.theme).overrideWith(data);
  }

  @override
  Widget build(BuildContext context) {
    final data = resolveData();
    return _EquatorInheritedTheme(
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
class EquatorThemeData {
  final AppThemeVariant? variant;
  final ThemeMode? themeMode;
  final Iterable<ThemeExtension<dynamic>>? extensions;
  final bool? useMaterial3;

  const EquatorThemeData({
    this.variant = AppThemeVariant.purple,
    this.themeMode,
    this.extensions,
    this.useMaterial3,
  });

  ThemeData get theme => (variant?.theme)!.overrideWith(this);

  ThemeData get darkTheme => (variant?.darkTheme)!.overrideWith(this);

  EquatorThemeData copyWith({
    AppThemeVariant? variant,
    bool? highContrast,
    ThemeMode? themeMode,
    Iterable<ThemeExtension<dynamic>>? extensions,
    PageTransitionsTheme? pageTransitionsTheme,
    bool? useMaterial3,
    VisualDensity? visualDensity,
  }) {
    return EquatorThemeData(
      variant: variant ?? this.variant,
      themeMode: themeMode ?? this.themeMode,
      extensions: extensions ?? this.extensions,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
    );
  }
}

class _EquatorInheritedTheme extends InheritedTheme {
  const _EquatorInheritedTheme({
    required this.data,
    required super.child,
  });

  final EquatorThemeData? data;

  @override
  bool updateShouldNotify(covariant _EquatorInheritedTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _EquatorInheritedTheme(data: data, child: child);
  }
}

extension _EquatorThemeDataX on ThemeData {
  ThemeData overrideWith(EquatorThemeData data) {
    return copyWith(
      extensions: data.extensions,
    );
  }
}
