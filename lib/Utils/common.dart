import 'package:flutter/material.dart';

SizedBox heightSizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

Container heightSizedBox2(double height) {
  return Container(height: height);
}

SizedBox widthSizedBox(double width) {
  return SizedBox(
    width: width,
  );
}

double getTop(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}
//
// Divider divider({double? thickness}) {
//   return Divider(
//     height: 1,
//     color: greyColor,
//     thickness: thickness ?? 1,
//   );
// }

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

navigationPop(BuildContext context) {
  Navigator.of(context).pop();
}

Future navigationPush(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
}

navigationPushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

navigationRemoveUntil(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}
