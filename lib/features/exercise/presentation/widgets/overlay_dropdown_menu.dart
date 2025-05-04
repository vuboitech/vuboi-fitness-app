import 'package:fitness/theme/src/themes/commons/app_theme.dart';
import 'package:fitness/theme/src/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
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

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
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
          menuItem(
            context: context,
            iconSvgUri: 'assets/icons/ic_lightning_bold.svg',
            title: 'Add Note',
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
          ),
        ],
      ),
    );
  }

  Widget menuItem({
    required BuildContext context,
    required String iconSvgUri,
    required String title,
    bool isDestructive = false,
  }) {
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
}
