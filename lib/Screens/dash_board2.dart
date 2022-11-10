import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:rentaroof/Screens/saved.dart';

import '../Utils/style.dart';
import 'chat_list.dart';
import 'home.dart';
import 'profile.dart';

// ignore: must_be_immutable
class DashBoard extends StatefulWidget {
  int selectedPos;

  DashBoard({Key? key, this.selectedPos = 0}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double bottomNavBarHeight = 50;

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController =
        CircularBottomNavigationController(widget.selectedPos);
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  Widget bodyContainer() {
    Widget bodyWidget;
    switch (widget.selectedPos) {
      case 0:
        bodyWidget = const Home();
        break;
      case 1:
        bodyWidget = const Saved();
        break;
      case 2:
        bodyWidget = const ChatList();
        break;
      case 3:
        bodyWidget = const Profile();
        break;
      default:
        bodyWidget = const Home();
        break;
    }

    return bodyWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularBottomNavigation(
              [
                TabItem(
                  widget.selectedPos == 0 ? Icons.home : Icons.home_outlined,
                  "Home",
                  primaryYellowColor,
                  labelStyle: TextStyle(
                      color: primaryYellowColor, fontWeight: FontWeight.bold),
                ),
                TabItem(
                  widget.selectedPos == 1
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined,
                  "Save",
                  primaryYellowColor,
                  labelStyle: TextStyle(
                      color: primaryYellowColor, fontWeight: FontWeight.bold),
                ),
                TabItem(
                  widget.selectedPos == 2
                      ? Icons.chat_bubble
                      : Icons.chat_bubble_outline,
                  "Chat",
                  primaryYellowColor,
                  labelStyle: TextStyle(
                      color: primaryYellowColor, fontWeight: FontWeight.bold),
                ),
                TabItem(
                  widget.selectedPos == 3 ? Icons.person : Icons.person_outline,
                  "Profile",
                  primaryYellowColor,
                  labelStyle: TextStyle(
                      color: primaryYellowColor, fontWeight: FontWeight.bold),
                ),
              ],
              controller: _navigationController,
              selectedPos: widget.selectedPos,
              barHeight: bottomNavBarHeight,
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
              selectedCallback: (int? selectedPos) {
                setState(() {
                  widget.selectedPos = selectedPos ?? 0;
                });
              },
            ),
          )
        ],
      ),
    ); /*Scaffold(
      body: bodyContainer(),
      bottomNavigationBar: CircularBottomNavigation(
        [
          TabItem(
            widget.selectedPos == 0 ? Icons.home : Icons.home_outlined,
            "Home",
            primaryYellowColor,
            labelStyle: TextStyle(
                color: primaryYellowColor, fontWeight: FontWeight.bold),
          ),
          TabItem(
            widget.selectedPos == 1
                ? Icons.filter_alt
                : Icons.filter_alt_outlined,
            "Save",
            primaryYellowColor,
            labelStyle: TextStyle(
                color: primaryYellowColor, fontWeight: FontWeight.bold),
          ),
          TabItem(
            widget.selectedPos == 2
                ? Icons.chat_bubble
                : Icons.chat_bubble_outline,
            "Chat",
            primaryYellowColor,
            labelStyle: TextStyle(
                color: primaryYellowColor, fontWeight: FontWeight.bold),
          ),
          TabItem(
            widget.selectedPos == 3 ? Icons.person : Icons.person_outline,
            "Profile",
            primaryYellowColor,
            labelStyle: TextStyle(
                color: primaryYellowColor, fontWeight: FontWeight.bold),
          ),
        ],
        controller: _navigationController,
        selectedPos: widget.selectedPos,
        barHeight: bottomNavBarHeight,
        barBackgroundColor: transparentColor,
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
        selectedCallback: (int? selectedPos) {
          setState(() {
            widget.selectedPos = selectedPos ?? 0;
          });
        },
      ),
    );*/
  }
}
