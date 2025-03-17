import 'package:fitness/theme/lib.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class ExerciseListPageNew extends StatefulWidget {
  static const String routeName = '/new-exercise-list';
  const ExerciseListPageNew({Key? key}) : super(key: key);

  @override
  _ExerciseListPageNewState createState() => _ExerciseListPageNewState();
}

class _ExerciseListPageNewState extends State<ExerciseListPageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20, 20, 20, 8,
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '5 Selected',

                ),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        variant: ButtonVariant.secondary,
                        onPressed: () {},
                        text: 'Back',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {},
                        text: 'Select',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ).asGlass(),
    );
  }
}
