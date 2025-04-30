// custom_reorderable_drag_listener.dart

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Custom version that exposes the drag functionality
class CustomReorderableDragStartListener extends StatelessWidget {
  const CustomReorderableDragStartListener({
    Key? key,
    required this.child,
    required this.index,
    this.enabled = true,
  }) : super(key: key);

  final Widget child;
  final int index;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: enabled ? (PointerDownEvent event) => startDragging(context, event) : null,
      child: child,
    );
  }

  // This method is now public and can be called from outside
  MultiDragGestureRecognizer createRecognizer() {
    return ImmediateMultiDragGestureRecognizer(debugOwner: this);
  }

  // This method is now public and can be called from outside
  void startDragging(BuildContext context, PointerDownEvent event) {
    final DeviceGestureSettings? gestureSettings = MediaQuery.maybeGestureSettingsOf(context);
    final state = SliverReorderableList.maybeOf(context);
    state?.startItemDragReorder(
      index: index,
      event: event,
      recognizer: createRecognizer()
        ..gestureSettings = gestureSettings,
    );
  }

  // Utility method to programmatically start dragging for a specific index
  static void startDraggingAt(BuildContext context, int index, PointerDownEvent event) {
    final state = SliverReorderableList.maybeOf(context);
    if (state != null) {
      final recognizer = ImmediateMultiDragGestureRecognizer(debugOwner: context);
      final gestureSettings = MediaQuery.maybeGestureSettingsOf(context);
      recognizer.gestureSettings = gestureSettings;

      state.startItemDragReorder(
        index: index,
        event: event,
        recognizer: recognizer,
      );
    }
  }
}

// You can also create a delayed version
class CustomReorderableDelayedDragStartListener extends CustomReorderableDragStartListener {
  const CustomReorderableDelayedDragStartListener({
    super.key,
    required super.child,
    required super.index,
    super.enabled,
  });

  @override
  MultiDragGestureRecognizer createRecognizer() {
    return DelayedMultiDragGestureRecognizer(debugOwner: this);
  }
}
