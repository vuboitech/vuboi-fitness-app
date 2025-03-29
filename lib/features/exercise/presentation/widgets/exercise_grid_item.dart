import 'package:fitness/theme/src/themes/commons/app_theme.dart';
import 'package:flutter/material.dart';

class ExerciseGridItem extends StatelessWidget {
  const ExerciseGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: context.theme.appColor.bgPrimary,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: context.theme.appColor.borderPrimary,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 12),
                child: Image.asset(
                  'assets/images/img_crunch.png',
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12,
              ),
              child: Column(
                children: [
                  Text(
                    'Crunch',
                    style: context.theme.appTextTheme.textMdBold.copyWith(
                      color: context.theme.appColor.textPrimary,
                    ),
                  ),
                  Text(
                    'Abs',
                    style: context.theme.appTextTheme.textSmRegular.copyWith(
                      color: context.theme.appColor.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
