import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  static const routeName = '/discover';

  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();

  static const navigation = <NavigationDestination>[
    NavigationDestination(
      selectedIcon: Icon(
        Icons.home,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      label: 'Home',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.account_balance_wallet,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.computer,
        color: Colors.white,
      ),
      label: 'Tv Show',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.warning,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.remove_red_eye,
        color: Colors.white,
      ),
      label: 'WatchList',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.sports_soccer,
        color: Colors.green,
      ),
      icon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      label: 'Settings',
    ),
  ];
}

class _DiscoverPageState extends State<DiscoverPage> {
  final page = [
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  int drawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(color: Colors.white, fontSize: 11),
          ),
        ),
        child: NavigationBar(
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: drawerIndex,
          height: 60,
          elevation: 0,
          backgroundColor: Colors.blueGrey.withOpacity(0.2),
          onDestinationSelected: (int index) {
            setState(() {
              drawerIndex = index;
            });
          },
          destinations: DiscoverPage.navigation,
        ),
      ),
    );
  }
}
