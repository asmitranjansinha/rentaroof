import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

import '../views/dash_board2.dart';
import '../utils/common.dart';
import '../utils/style.dart';

// ignore: must_be_immutable
class FooterItem extends StatefulWidget {
  int? selectedPos;

  FooterItem({Key? key, this.selectedPos = 0}) : super(key: key);

  @override
  State<FooterItem> createState() => _FooterItemState();
}

class _FooterItemState extends State<FooterItem> {
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController =
        CircularBottomNavigationController(widget.selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return CircularBottomNavigation(
      [
        TabItem(
          widget.selectedPos == 0 ? Icons.home : Icons.home_outlined,
          "Home",
          primaryYellowColor,
          labelStyle:
              TextStyle(color: primaryYellowColor, fontWeight: FontWeight.bold),
        ),
        TabItem(
          widget.selectedPos == 1
              ? Icons.filter_alt
              : Icons.filter_alt_outlined,
          "Save",
          primaryYellowColor,
          labelStyle:
              TextStyle(color: primaryYellowColor, fontWeight: FontWeight.bold),
        ),
        TabItem(
          widget.selectedPos == 2
              ? Icons.chat_bubble
              : Icons.chat_bubble_outline,
          "Chat",
          primaryYellowColor,
          labelStyle:
              TextStyle(color: primaryYellowColor, fontWeight: FontWeight.bold),
        ),
        TabItem(
          widget.selectedPos == 3 ? Icons.person : Icons.person_outline,
          "Profile",
          primaryYellowColor,
          labelStyle:
              TextStyle(color: primaryYellowColor, fontWeight: FontWeight.bold),
        ),
      ],
      controller: _navigationController,
      selectedPos: widget.selectedPos ?? 0,
      barHeight: 50,
      barBackgroundColor: whiteColor,
      circleSize: 50,
      iconsSize: 25,
      normalIconColor: primaryYellowColor,
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            offset: const Offset(-0.1, -0.1)),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? i) =>
          navigationRemoveUntil(context, DashBoard(selectedPos: i ?? 0)),
    );
  }
}
