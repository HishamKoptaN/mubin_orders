import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({
    super.key,
  });
  static const String routeName = "MobileLayout";
  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int selectedIndex = 0;

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
