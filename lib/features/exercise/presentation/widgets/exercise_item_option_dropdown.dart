import 'package:fitness/features/exercise/domain/models/exercise_item.dart';
import 'package:fitness/theme/src/themes/commons/app_theme.dart';
import 'package:fitness/theme/src/widgets/button/primary_button.dart';
import 'package:fitness/theme/src/widgets/radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseItemOptionDropdown extends StatefulWidget {
  final ValueChanged<ExerciseUnitMeasurement> onSelected;

  const ExerciseItemOptionDropdown({
    super.key,
    required this.onSelected,
  });

  @override
  State<StatefulWidget> createState() => ExerciseItemOptionDropdownState();
}

class ExerciseItemOptionDropdownState extends State<ExerciseItemOptionDropdown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    _tooltipController.hide();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomRight,
                followerAnchor: Alignment.topRight,
                child: const MenuWidget(),
              ),
            ],
          );
        },
        child: PrimaryButton(
          iconSvgUri: 'assets/icons/ic_vertical_dots.svg',
          variant: ButtonVariant.secondary,
          onPressed: onTap,
        ),
      ),
    );
  }

  void onTap() {
    _tooltipController.toggle();
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
  });

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  ExerciseUnitMeasurement _selectedUnit = ExerciseUnitMeasurement.kg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      decoration: ShapeDecoration(
        color: context.theme.appColor.bgPrimary,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: context.theme.appColor.borderSecondary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          context.theme.appShadow.shadowLg3,
          context.theme.appShadow.shadowLg2,
          context.theme.appShadow.shadowLg1,
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          _radioMenuItem(
            context: context,
            rightLabel: 'Kg',
            label: 'Kilogram',
            value: ExerciseUnitMeasurement.kg,
            groupValue: _selectedUnit,
            onChanged: (value) {
              setState(() {
                _selectedUnit = value;
              });
            },
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            )
          ),
          _radioMenuItem(
            context: context,
            rightLabel: 'Lbs',
            label: 'Pounds',
            value: ExerciseUnitMeasurement.lbs,
            groupValue: _selectedUnit,
            onChanged: (value) {
              setState(() {
                _selectedUnit = value;
              });
            },
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            color: context.theme.appColor.borderSecondary,
          ),
          menuItem(
            context: context,
            iconSvgUri: 'assets/icons/ic_reorder.svg',
            title: 'Change Workout',
          ),
          menuItem(
            context: context,
            iconSvgUri: 'assets/icons/ic_trash.svg',
            title: 'Delete',
            isDestructive: true,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget menuItem({
    required BuildContext context,
    required String iconSvgUri,
    required String title,
    bool isDestructive = false,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: context.theme.appColor.bgPrimary,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconSvgUri,
              colorFilter: ColorFilter.mode(
                isDestructive
                    ? context.theme.appColor.fgErrorSecondary
                    : context.theme.appColor.textPrimary,
                BlendMode.srcIn,
              ),
              height: 16,
              width: 16,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: context.theme.appTextTheme.textSmSemibold.copyWith(
                color: isDestructive
                    ? context.theme.appColor.fgErrorPrimary
                    : context.theme.appColor.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioMenuItem({
    required BuildContext context,
    required ExerciseUnitMeasurement value,
    required String label,
    required String rightLabel,
    required ExerciseUnitMeasurement groupValue,
    required ValueChanged<ExerciseUnitMeasurement> onChanged,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return TextButton(
      onPressed: () {
        onChanged(value);
      },
      style: TextButton.styleFrom(
        backgroundColor: context.theme.appColor.bgPrimary,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomRadioButton<ExerciseUnitMeasurement>(
            value: value,
            label: label,
            groupValue: groupValue,
            labelStyle: context.theme.appTextTheme.textSmSemibold.copyWith(
              color: context.theme.appColor.textSecondary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 1,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: context.theme.appColor.borderSecondary,
                width: 1,
              ),
            ),
            child: Text(
              rightLabel,
              style: context.theme.appTextTheme.textSmMedium.copyWith(
                color: context.theme.appColor.textQuaternary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
