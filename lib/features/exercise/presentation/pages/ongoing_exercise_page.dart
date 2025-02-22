import 'package:fitness/features/exercise/domain/models/exercise_item.dart';
import 'package:fitness/features/exercise/presentation/widgets/custom_expansion.dart';
import 'package:fitness/features/home/presentation/widgets/modules/vuboi_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class OngoingExercisePage extends StatefulWidget {
  static const routeName = '/exercise/ongoing';

  const OngoingExercisePage({super.key});

  @override
  State<OngoingExercisePage> createState() => _OngoingExercisePageState();
}

class _OngoingExercisePageState extends State<OngoingExercisePage> {
  final List<ExerciseItem> items = List.generate(
    10,
    (index) => ExerciseItem(
      id: index.toString(),
      title: 'Item ${index + 1}',
      content: 'Content of item ${index + 1}',
      isExpanded: true,
    ),
  );
  List<ExerciseItem> previousStates = [];

  int? highlightedIndex;

  final AutoScrollController _autoScrollController = AutoScrollController();

  void _onReorder(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) newIndex--; // Adjust index for correct movement
    setState(() {
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
      highlightedIndex = newIndex;
    });

    setState(() {
      items[newIndex].isExpanded = true;
    });

    // restore previous expansion states
    // for (var i = 0; i < items.length; i++) {
    //   items[i].isExpanded = previousStates.where((element) => element.id == items[i].id).first.isExpanded;
    // }

    // Remove highlight after some time
    await Future.delayed(const Duration(milliseconds: 250));
    if (mounted) {
      setState(() {
        highlightedIndex = null;
      });
    }

    _autoScrollController.scrollToIndex(
      newIndex,
      preferPosition: AutoScrollPosition.middle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VuboiAppBar(
            title: 'Sikel Day',
            onSearch: (String searchQuery) {},
          ),
          Expanded(
            child: ReorderableListView.builder(
              scrollController: _autoScrollController,
              itemCount: items.length,
              onReorder: _onReorder,
              onReorderStart: (index) {
                setState(() {
                  // Save previous expansion states
                  previousStates = items
                      .map(
                        (item) => ExerciseItem(
                          id: item.id,
                          title: item.title,
                          content: item.content,
                          isExpanded: item.isExpanded,
                        ),
                      )
                      .toList();

                  // Collapse **all** items before dragging, including the dragged one
                  for (var element in items) {
                    element.isExpanded = false;
                  }
                });

                print(previousStates[index].isExpanded); // Debugging
                print(items[index].isExpanded); // Should be false now
              },
              padding: const EdgeInsets.all(8),
              proxyDecorator: (widget, index, animation) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 8,
                      ),
                      child: Row(
                        key: ValueKey(items[index]),
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
                                    const Text(
                                      'Lat Pulldown•Cable',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      items[index].content,
                                      style: const TextStyle(
                                        fontSize: 12,
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
                              ReorderableDragStartListener(
                                index: index,
                                child: const Icon(Icons.drag_indicator),
                              ),
                              const Icon(Icons.expand_more),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemBuilder: (context, index) {
                return AutoScrollTag(
                  key: ValueKey(items[index]),
                  controller: _autoScrollController,
                  index: index,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: highlightedIndex == index
                            ? [
                                const BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 12,
                                  spreadRadius: 2,
                                ),
                              ]
                            : [
                                const BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                ),
                              ],
                      ),
                      child: CustomExpansionWidget(
                        isExpanded: items[index].isExpanded,
                        onExpansionChanged: (isExpanded) {
                          setState(() {
                            items[index].isExpanded = isExpanded;
                          });
                        },
                        headerBuilder: (isExpanded, toggleExpand) {
                          return TextButton(
                            onPressed: () => toggleExpand(),
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                                bottom: 8,
                              ),
                              child: Row(
                                key: ValueKey(items[index]),
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 52,
                                          width: 52,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Lat Pulldown•Cable',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              items[index].content,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ReorderableDragStartListener(
                                        index: index,
                                        child: const Icon(Icons.drag_indicator),
                                      ),
                                      Icon(
                                        isExpanded
                                            ? Icons.expand_less
                                            : Icons.expand_more,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        body: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: const Column(
                            children: [
                              RepWidget(),
                              RepWidget(),
                              RepWidget(),
                              RepWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RepWidget extends StatelessWidget {
  const RepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // add radio button without any additional padding or margin!
          Radio(
            value: null,
            groupValue: null,
            onChanged: (value) {},
          ),
          // add textfield that filled and has rounded corner
          Container(
            width: 68,
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const Text(
            'Kg',
          ),
          Container(
            width: 68,
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const Text(
            'Reps',
          ),
        ],
      ),
    );
  }
}

class CollapsibleHeader extends StatelessWidget {
  const CollapsibleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
