import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';

class OngoingExerciseItem extends StatefulWidget {
  final bool isExpanded;
  final Function(bool) onExpansionChanged;
  final VoidCallback? onLongPress;

  const OngoingExerciseItem({
    super.key,
    required this.isExpanded,
    required this.onExpansionChanged,
    this.onLongPress,
  });

  @override
  State<OngoingExerciseItem> createState() => _OngoingExerciseItemState();
}

class _OngoingExerciseItemState extends State<OngoingExerciseItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (widget.isExpanded) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant OngoingExerciseItem oldWidget) {
    if (oldWidget.isExpanded != widget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onExpansionChanged(!widget.isExpanded),
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lat Pulldown•Cable',
                            style: context.theme.appTextTheme.textSmMedium,
                          ),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, item) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 6,
                                        width: 6,
                                        margin: const EdgeInsets.only(right: 5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        'Hewo'
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          GestureDetector(
            onLongPress: () {
              widget.onLongPress?.call();
            },
            child: AnimatedBuilder(
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
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.appColor.bgTertiary,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Set',
                            style:
                                context.theme.appTextTheme.textXsMedium.copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Repetition',
                            style:
                                context.theme.appTextTheme.textXsMedium.copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Weight',
                            style:
                                context.theme.appTextTheme.textXsMedium.copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            '',
                            style:
                                context.theme.appTextTheme.textXsMedium.copyWith(
                              color: context.theme.appColor.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        key: Key('container-$index'),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: context.theme.appColor.background,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                (index + 1).toString(),
                                style: context.theme.appTextTheme.textXsMedium
                                    .copyWith(
                                  color: context.theme.appColor.textSecondary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  filled: false,
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                ),
                                textAlign: TextAlign.center,
                                style: context.theme.appTextTheme.textSmMedium
                                    .copyWith(
                                  color: context.theme.appColor.textPrimary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Weight',
                                style: context.theme.appTextTheme.textXsMedium
                                    .copyWith(
                                  color: context.theme.appColor.textSecondary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: context.theme.appColor.bgTertiary,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: PrimaryButton(
                            text: 'Add Set',
                            variant: ButtonVariant.secondary,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: PrimaryButton(
                            iconSvgUri: 'assets/icons/ic_book.svg',
                            variant: ButtonVariant.secondary,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
