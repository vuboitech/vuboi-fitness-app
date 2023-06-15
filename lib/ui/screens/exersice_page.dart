import 'dart:math';

import 'package:card_stack_widget/model/card_model.dart';
import 'package:card_stack_widget/model/card_orientation.dart';
import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:fitness/ui/widgets/base/button.dart';
import 'package:fitness/ui/widgets/base/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExersicePage extends StatelessWidget {
  const ExersicePage({Key? key}) : super(key: key);

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
                  text: 'Program'
                ),
              ),
              Expanded(
                child: _subMenuItem(
                  iconSvgUri: 'assets/icons/ic_book.svg',
                  text: 'Insight'
                ),
              ),
              Expanded(
                child: _subMenuItem(
                  iconSvgUri: 'assets/icons/ic_watch.svg',
                  text: 'Device'
                ),
              ),
              Expanded(
                child: _subMenuItem(
                  iconSvgUri: 'assets/icons/ic_location_pin.svg',
                  text: 'Gymnasium'
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
            positionFactor: 2,
            scaleFactor: 1.5,
            alignment: Alignment.center,
            reverseOrder: true,
            dismissedCardDuration: const Duration(milliseconds: 150),
            animateCardScale: true,
            cardList: mockList,
          ),
        ),

        const SizedBox(height: 800)
      ],
    );
  }

  Widget _subMenuItem({
    required String iconSvgUri,
    required String text
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {},
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
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Colors.black
            ),
          )
        ],
      ),
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
              color: Color(0xFFF7F7FC),
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
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Yanomami_Woman_%26_Child.jpg/1200px-Yanomami_Woman_%26_Child.jpg"),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Dianne Ruscell',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_diamond.svg',
                  height: 12,
                  width: 12,
                ),
                SizedBox(width: 4),
                Text(
                  'Tier:',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                ),
                SizedBox(width: 2),
                Text(
                  'Gym Rat',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF14142A)
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _exerciseItem() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6503CE),
            Color(0xFF00B5DA),
          ],
          stops: [0.1385, 1],
          transform: GradientRotation(105.89 * 3.14159 / 180),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hypertrophy Leg',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white
            ),
          ),

          const SizedBox(height: 8),

          Container(
            height: 18,
            margin: EdgeInsets.only(bottom: 16),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Label(text: 'Moshingan'),
                );
              }
            ),
          ),
          Button(
            iconSvgUri: 'assets/icons/ic_lightning.svg',
            text: "Start Exercise",
            onPressed: () {},
          )
        ],
      ),
    );
  }

  _buildMockList(BuildContext context, {int size = 0}) {
    final double containerWidth = MediaQuery
        .of(context)
        .size
        .width - 16;

    var list = <CardModel>[];
    for (int i = 0; i < size; i++) {
      var color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

      list.add(
        CardModel(
          radius: Radius.circular(8),
          shadowColor: Colors.black.withOpacity(0.2),
          child: SizedBox(
            height: 310,
            width: containerWidth,
            child: _exerciseItem(), // Whatever you want
          ),
        ),
      );
    }

    return list;
  }
}