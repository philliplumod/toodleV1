import 'package:flutter/material.dart';
import 'package:toddle/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Text(
            'Hello World',
          )),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().changeTheme();
        },
        child: const Icon(
          Icons.nightlight,
          size: 20,
        ),
      ),
      actions: const [Icon(Icons.person, size: 20), SizedBox(width: 20)],
    );
  }
}
