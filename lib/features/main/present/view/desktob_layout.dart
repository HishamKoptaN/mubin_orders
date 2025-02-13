import 'package:flutter/material.dart';

class DesktobLayout extends StatefulWidget {
  const DesktobLayout({
    super.key,
  });
  static const String routeName = "DesktobLayout";
  @override
  State<DesktobLayout> createState() => _DesktobLayoutState();
}

class _DesktobLayoutState extends State<DesktobLayout> {
  int selectedIndex = 0;

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('home_view'),
      body: Column(
        children: [
          // HomeHeader(
          //   selectedIndex: selectedIndex,
          //   onItemSelected: onItemSelected,
          // ),
          // Expanded(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SideBarView(
          //         selectedIndex: selectedIndex,
          //         onItemSelected: onItemSelected,
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: HomeViewBody(
          //           currentViewIndex: selectedIndex,
          //         ),
          //       ),
          //       SuggestedBarView(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
