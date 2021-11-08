import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static MaterialPage page() {
    return const MaterialPage(
      key: ValueKey("/home"),
      name: "/home",
      child: HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Home Screen"),
    );
  }
}
