import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
