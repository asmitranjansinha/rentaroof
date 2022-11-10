// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
// import 'package:rentaroof/Screens/home.dart';
//
// import '../Utils/style.dart';
//
// // ignore: must_be_immutable
// class DashBoard2 extends StatefulWidget {
//   String? currentTab;
//   Widget? currentPage;
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//
//   DashBoard2({super.key, this.currentTab = "Home"});
//
//   @override
//   State<DashBoard2> createState() => _DashBoard2State();
// }
//
// class _DashBoard2State extends State<DashBoard2> {
//   @override
//   initState() {
//     super.initState();
//     _selectTab(widget.currentTab!);
//   }
//
//   List<String> tabList = ["Home", "Save", "Chat", "Profile"];
//
//   void _selectTab(String tabItem) {
//     setState(() {
//       widget.currentTab = tabItem;
//       // print(widget.currentTab);
//       switch (tabItem) {
//         case "Home":
//           widget.currentPage = const Home();
//           break;
//         case "Save":
//           widget.currentPage = const Center(child: Text("Save"));
//           break;
//         case "Chat":
//           widget.currentPage = const Center(child: Text("Chat"));
//           break;
//         case "Profile":
//           widget.currentPage = const Center(child: Text("Profile"));
//           break;
//         default:
//           widget.currentPage = const Home();
//           break;
//       }
//     });
//   }
//
//   DateTime now1 = DateTime.now();
//
//   late DateTime currentBackPressTime = DateTime(now1.day - 1);
//
//   Future<bool> onWillPop() async {
//     DateTime now = DateTime.now();
//     if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       // flutterToast('Tap again to close app');
//       return Future.value(false);
//     }
//     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//     return Future.value(true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: onWillPop,
//       child: Scaffold(
//         key: widget.scaffoldKey,
//         body: widget.currentPage,
//         bottomNavigationBar: MotionTabBar(
//           initialSelectedTab: widget.currentTab ?? "Home",
//           labels: tabList,
//           icons: const [
//             /* widget.currentTab == 0 ? Icons.home :*/ Icons.home_outlined,
//             Icons.save_outlined,
//             Icons.chat_bubble_outline,
//             Icons.person_outline
//           ],
//
//           // optional badges, length must be same with labels
//           // badges: [
//           //   // Default Motion Badge Widget
//           //   const MotionBadgeWidget(
//           //     text: '99+',
//           //     textColor: Colors.white, // optional, default to Colors.white
//           //     color: Colors.red, // optional, default to Colors.red
//           //     size: 18, // optional, default to 18
//           //   ),
//           //
//           //   // custom badge Widget
//           //   Container(
//           //     color: Colors.black,
//           //     padding: const EdgeInsets.all(2),
//           //     child: const Text(
//           //       '48',
//           //       style: TextStyle(
//           //         fontSize: 14,
//           //         color: Colors.white,
//           //       ),
//           //     ),
//           //   ),
//           //
//           //   // allow null
//           //   null,
//           //
//           //   // Default Motion Badge Widget with indicator only
//           //   const MotionBadgeWidget(
//           //     isIndicator: true,
//           //     color: Colors.red, // optional, default to Colors.red
//           //     size: 5, // optional, default to 5,
//           //     show: true, // true / false
//           //   ),
//           // ],
//           tabSize: 40,
//           tabBarHeight: 45,
//           textStyle: TextStyle(
//             fontSize: 12,
//             color: primaryYellowColor,
//             fontWeight: FontWeight.w500,
//           ),
//           tabIconColor: primaryYellowColor,
//           tabIconSize: 25.0,
//           tabIconSelectedSize: 25.0,
//           tabSelectedColor: primaryYellowColor,
//           tabIconSelectedColor: whiteColor,
//           tabBarColor: whiteColor,
//           onTabItemSelected: (int value) {
//             _selectTab(tabList[value]);
//
//             setState(() {});
//           },
//         ),
//       ),
//     );
//   }
// }
