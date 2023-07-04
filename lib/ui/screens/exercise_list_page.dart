import 'package:fitness/ui/widgets/base/button.dart';
import 'package:fitness/ui/widgets/modules/vuboi_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseListPage extends StatefulWidget {

  const ExerciseListPage({
    Key? key,
  }) : super(key: key);

  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> with TickerProviderStateMixin {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, //iOS
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF0F6),
      body: SafeArea(
        child: Column(
          children: [
            VuboiAppBar(
              title: 'Exercise',
              onSearch: (String searchQuery) {},
            ),
          ],
        ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                '0 Selected',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color(0xFF610BEF)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 1),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Button(
                        style: AppButtonStyle.primary,
                        text: 'Start Exercise',
                        onPressed: () {},
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Button(
                          style: AppButtonStyle.text,
                          text: 'Custom',
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
