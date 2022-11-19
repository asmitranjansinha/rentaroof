// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/Utils/common.dart';
import 'package:rentaroof/Utils/iamge_constants.dart';

import '../Utils/shared_helper.dart';
import 'dash_board2.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();

// _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedHelper sharedHelper = SharedHelper();

  @override
  void initState() {
    getValidationData();
    super.initState();
  }

  getValidationData() async {
    sharedHelper.setBool("seen", false);
    print(await sharedHelper.getBool("seen"));

    if (!await sharedHelper.getBool("seen")) {
      // print(await sharedHelper.getBool("seen"));
      sharedHelper.setBool("seen", false);
      Timer(const Duration(seconds: 3),
          () => navigationRemoveUntil(context, const LoginWidget2()));
    } else {
      Timer(const Duration(seconds: 3),
          () => navigationRemoveUntil(context, DashBoard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 70.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFFC1E3FD),
              Color(0XFFF1F6FD),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // image: DecorationImage(
          //     image: AssetImage("assets/splashbg.png"), fit: BoxFit.fitHeight),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
              ),
              child: SvgPicture.asset(
                logo,
                height: 130,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Image.asset(
                ImageConstants.splashScreenImg,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
