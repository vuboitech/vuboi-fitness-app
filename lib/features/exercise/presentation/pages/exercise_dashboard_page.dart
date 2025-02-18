import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/features/exercise/presentation/pages/exercise_list_page.dart';
import 'package:fitness/features/home/presentation/widgets/base/button.dart';
import 'package:fitness/features/home/presentation/widgets/base/label.dart';
import 'package:fitness/features/home/presentation/widgets/modules/stacks/card_model.dart';
import 'package:fitness/features/home/presentation/widgets/modules/stacks/card_stack_widget.dart';
import 'package:fitness/theme/colors.dart';
import 'package:fitness/theme/themes/commons/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExerciseDashboardPage extends StatefulWidget {
  static const String routeName = '/exercise/dashboard';

  const ExerciseDashboardPage({super.key});

  @override
  State<ExerciseDashboardPage> createState() => _ExerciseDashboardPageState();
}

class _ExerciseDashboardPageState extends State<ExerciseDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final mockList = _buildMockList(context, size: 3);

    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _profileBar(),
        ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _subMenuItem(
                  iconSvgUri: 'assets/icons/ic_dumbbell.svg',
                  text: 'Program',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExerciseListPage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _subMenuItem(
                  iconSvgUri: 'assets/icons/ic_book.svg',
                  text: 'Insight',
                ),
              ),
              Expanded(
                child: _subMenuItem(
                  iconSvgUri: 'assets/icons/ic_watch.svg',
                  text: 'Device',
                ),
              ),
              Expanded(
                child: _subMenuItem(
                  iconSvgUri: 'assets/icons/ic_location_pin.svg',
                  text: 'Gymnasium',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 262,
          child: CardStackWidget(
            opacityChangeOnDrag: true,
            swipeOrientation: CardOrientation.both,
            cardDismissOrientation: CardOrientation.both,
            positionFactor: 2.2,
            scaleFactor: 1,
            alignment: Alignment.center,
            reverseOrder: true,
            dismissedCardDuration: const Duration(milliseconds: 150),
            animateCardScale: true,
            cardList: mockList,
          ),
        ),
      ],
    );
  }

  Widget _profileBar() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFF7F7FC),
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(48, 49, 51, 0.08),
                offset: Offset(0, 2),
                blurRadius: 2,
              ),
              BoxShadow(
                color: Color.fromRGBO(48, 49, 51, 0.08),
                offset: Offset(0, 0),
                blurRadius: 0.5,
              ),
            ],
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Yanomami_Woman_%26_Child.jpg/1200px-Yanomami_Woman_%26_Child.jpg',
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Dianne Ruscell',
              style: context.theme.appTextTheme.title24SemiBold,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_diamond.svg',
                  height: 12,
                  width: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  'Tier:',
                  style: context.theme.appTextTheme.body14Regular,
                ),
                const SizedBox(width: 2),
                Text(
                  'Gym Rat',
                  style: context.theme.appTextTheme.body14Medium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _subMenuItem({
    required String iconSvgUri,
    required String text,
    Function? onPressed,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            SvgPicture.asset(
              iconSvgUri,
              height: 24,
              width: 24,
            ),
            const SizedBox(height: 7),
            Text(
              text,
              style: context.theme.appTextTheme.body13Medium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _exerciseItem(String name) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        gradient: AppColors.seaHalberd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 18,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const Label(text: 'Moshingan'),
                );
              },
            ),
          ),
          Button(
            style: AppButtonStyle.secondary,
            iconSvgUri: 'assets/icons/ic_lightning.svg',
            text: 'Start Exercise',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  List<CardModel> _buildMockList(BuildContext context, {int size = 0}) {
    final double containerWidth = MediaQuery.of(context).size.width - 32;

    var list = <CardModel>[];
    list.add(
      CardModel(
        radius: const Radius.circular(12),
        shadowColor: Colors.black.withOpacity(0.2),
        cardTitle: 'Hypertrophy Leg',
        child: SizedBox(
          height: 310,
          width: containerWidth,
          child: _exerciseItem('Hypertrophy Leg'), // Whatever you want
        ),
      ),
    );

    list.add(
      CardModel(
        radius: const Radius.circular(12),
        shadowColor: Colors.black.withOpacity(0.2),
        cardTitle: 'Sikel',
        child: SizedBox(
          height: 310,
          width: containerWidth,
          child: _exerciseItem('Sikel'), // Whatever you want
        ),
      ),
    );

    list.add(
      CardModel(
        radius: const Radius.circular(12),
        shadowColor: Colors.black.withOpacity(0.2),
        cardTitle: 'Asto',
        child: SizedBox(
          height: 310,
          width: containerWidth,
          child: _exerciseItem('Astoo'), // Whatever you want
        ),
      ),
    );

    return list;
  }
}
