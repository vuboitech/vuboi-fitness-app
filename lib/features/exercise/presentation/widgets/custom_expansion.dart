import 'package:flutter/material.dart';

class CustomExpansionWidget extends StatefulWidget {
  final Widget Function(bool isExpanded, VoidCallback toggleExpand) headerBuilder;
  final ValueChanged<bool> onExpansionChanged;
  final Widget body;
  final bool isExpanded;
  final BoxDecoration? decoration;

  const CustomExpansionWidget({
    super.key,
    required this.headerBuilder,
    required this.onExpansionChanged,
    required this.body,
    this.isExpanded = false,
    this.decoration,
  });

  @override
  State<CustomExpansionWidget> createState() => _CustomExpansionWidgetState();
}

class _CustomExpansionWidgetState extends State<CustomExpansionWidget>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void didUpdateWidget(covariant CustomExpansionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isExpanded != widget.isExpanded) {
      setState(() {
        _isExpanded = widget.isExpanded;
      });

      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) {
      _controller.value = 1; // Start expanded if needed
    }
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    widget.onExpansionChanged(_isExpanded);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: widget.headerBuilder(_isExpanded, _toggleExpand),
          ),
          /// This ensures smooth sliding effect
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  heightFactor: _animation.value,
                  alignment: Alignment.topCenter,
                  child: child,
                ),
              );
            },
            child: widget.body,
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

