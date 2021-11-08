import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static MaterialPage page() {
    return const MaterialPage(
      name: "/settings",
      key: ValueKey("/settings"),
      child: SettingsScreen(),
    );
  }

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Settings Screen"),
    );
  }
}
