import 'package:fitness/ui/widgets/base/button.dart';
import 'package:fitness/ui/widgets/base/chip/chip.dart';
import 'package:fitness/ui/widgets/base/chip/chip_group.dart';
import 'package:fitness/ui/widgets/modules/frame.dart';
import 'package:fitness/ui/widgets/modules/vuboi_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({
    super.key,
  });

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light, //iOS
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark, //iOS
      ),
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF0F6),
      body: Column(
        children: [
          VuboiAppBar(
            title: 'Exercise',
            chipGroup: const ChipGroup(
              chips: [
                AppChip(
                  label: 'All Exercise',
                  isActive: true,
                ),
                AppChip(label: 'Equipment'),
                AppChip(label: 'Target'),
              ],
            ),
            onSearch: (String searchQuery) {},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Frame(
                  title: '834 Exercise',
                  body: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 25,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dumbbell Bench Press',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF14142A),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        'Pectoral',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Color(0xFF6E7191),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 2),
                                        child: Text(
                                          '•',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Color(0xFF6E7191),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Dumbbell',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Color(0xFF6E7191),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                          index != 24
                              ? Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: const Color(0xFFEFF0F6),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEBECFE),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.12),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                '0 Selected',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0xFF610BEF),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Button(
                        style: AppButtonStyle.primary,
                        text: 'Start Exercise',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Button(
                          style: AppButtonStyle.text,
                          text: 'Custom',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
