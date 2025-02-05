import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScreen extends StatefulWidget {
  final Widget child;

  const AppScreen({super.key, required this.child});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  SystemUiOverlayStyle _overlayStyle = SystemUiOverlayStyle.light;

  void updateStatusBarStyle(SystemUiOverlayStyle style) {

    setState(() {
      _overlayStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: widget.child,
    );
  }
}
