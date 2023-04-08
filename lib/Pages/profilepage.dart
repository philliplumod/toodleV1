import 'package:flutter/material.dart';

import 'package:toddle/utilities/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
      child: Text(
        'Hello World',
        style: headingStyle,
      ),
    ));
  }
}
