import 'package:flutter/material.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({
    super.key,
  });
  static const String routeName = "TabletLayout";
  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  int selectedIndex = 0;

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
