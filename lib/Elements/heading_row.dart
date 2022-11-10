import 'package:flutter/material.dart';

import '../Utils/style.dart';

class HeadingRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const HeadingRow(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: mainHeadingTS,
              ),
              Text(
                subTitle,
                style: subTitleST,
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Text("See all", style: headingYellowTS),
                Container(
                  color: primaryYellowColor,
                  height: 1.5,
                  width: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
