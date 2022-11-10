import 'package:flutter/material.dart';

Color primaryBlueColor = const Color(0XFF2E4489);
Color lightblueColor = const Color(0XFFEAECF3);
Color primaryYellowColor = const Color(0XFFFAB21E);
Color whiteColor = const Color(0xFFffffff);
Color blackColor = const Color(0xFF000000);
Color greyColor = const Color(0xFF8e8a8a);
Color lightGreyColor = const Color(0XFFF9F9FB);
Color middleGreyColor = const Color(0XFFF1F1F1);
Color middle2GreyColor = const Color(0XFFF9F9FB);
Color transparentColor = const Color(0x00000000);
Color redColor = const Color(0x00FF0000);

TextStyle headingTS = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.bold,
  fontSize: 13.5,
);
TextStyle headingYellowTS = TextStyle(
  color: primaryYellowColor,
  fontWeight: FontWeight.bold,
  fontSize: 13.5,
);

TextStyle mainHeadingTS = TextStyle(
  color: primaryBlueColor,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

TextStyle whiteHeadingTS =
    TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 15);

TextStyle greyST = TextStyle(
  color: greyColor,
  fontSize: 15,
);
TextStyle subTitleST = TextStyle(
  color: greyColor,
  fontSize: 12,
);

BoxDecoration shadowDecoration = BoxDecoration(
  color: whiteColor,
  boxShadow: [
    BoxShadow(
        color: greyColor.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 10,
        offset: const Offset(0, 3)),
  ],
);

BoxDecoration boxDecoration = BoxDecoration(
  color: whiteColor,
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  boxShadow: [
    BoxShadow(
        color: greyColor.withOpacity(0.4),
        spreadRadius: 1,
        blurRadius: 10,
        offset: const Offset(0, 3)),
  ],
);
