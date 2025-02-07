import 'package:flutter/material.dart';

import '../utils/style.dart';

class BigButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final Color? color;
  final double? padding;
  final Widget? row;

  const BigButton(
      {super.key,
      this.title,
      @required this.onTap,
      this.color,
      this.padding,
      this.row});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? primaryBlueColor,
          // elevation: 2.0,
          // shadowColor: color?.withOpacity(0.5) ?? redColor.withOpacity(0.5),
          // padding: EdgeInsets.symmetric(vertical: padding ?? 10),
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        onPressed: onTap,
        child: title != null
            ? Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16, /*fontFamily: montserratSemiBold*/
                ),
              )
            : row ?? const Text(''),
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const MyOutlinedButton({Key? key, required this.onTap, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: primaryBlueColor,
        elevation: 2.0,
        side: BorderSide(width: 1.0, color: whiteColor),
      ),
      child: Text(
        label,
        style: whiteHeadingTS.copyWith(
          fontSize: 10,
        ),
      ),
    );
  }
}
