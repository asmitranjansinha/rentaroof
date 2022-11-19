import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/Elements/buttons.dart';

import '../Elements/dash_rect.dart';
import '../Elements/drawer.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class ReferNEarn extends StatefulWidget {
  const ReferNEarn({Key? key}) : super(key: key);

  @override
  State<ReferNEarn> createState() => _ReferNEarnState();
}

class _ReferNEarnState extends State<ReferNEarn> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: whiteColor,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => navigationPop(context),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: greyColor.withOpacity(0.50)),
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: SvgPicture.asset(leftArrow)),
            ),
            // InkWell(
            //   onTap: () => navigationPop(context),
            //   child: Container(
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //               width: 0.5, color: greyColor.withOpacity(0.50)),
            //           borderRadius: BorderRadius.circular(15)),
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            //       child: Image.asset(ImageConstants.back)),
            // ),
            widthSizedBox(10),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Chat",
                  style: mainHeadingTS,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: SvgPicture.asset(notification)
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Container(
            decoration: BoxDecoration(
              color: middle2GreyColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding:
                const EdgeInsets.symmetric(/*horizontal: 20,*/ vertical: 25),
            child: Column(
              children: [
                Text(
                  "User ID - UID-52544545654",
                  style: TextStyle(color: greyColor, fontSize: 18),
                ),
                heightSizedBox(25),
                Text(
                  "Your Referral Link",
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
                heightSizedBox(25),
                SizedBox(
                  height: 50,
                  width: 170,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "FADSBHKJ54",
                        style: TextStyle(color: greyColor, fontSize: 18),
                      ),
                      SizedBox(
                        height: 50,
                        width: 170,
                        child: DashedRect(
                            color: greyColor, strokeWidth: 2.0, gap: 2.0),
                      ),
                    ],
                  ),
                ),
                heightSizedBox(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(share),
                    SvgPicture.asset(copy)
                  ],
                ),
              ],
            ),
          ),
          heightSizedBox(25),
          row("01", "Invite your friends and get credits!"),
          dotLine(),
          row("01", "Referrals are people who registered at your invitation."),
          dotLine(),
          row("01",
              "After successful referral you will get 50 points. User you referred wil get 150 points."),
          heightSizedBox(25),
          BigButton(
              onTap: () {}, title: "Refer Now", color: primaryYellowColor),
          heightSizedBox(25),
        ],
      ),
    );
  }

  Widget row(String n, String t) {
    return Row(
      children: [
        Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: greyColor.withOpacity(0.50)),
                borderRadius: BorderRadius.circular(25)),
            // padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Text(
              n,
              style: TextStyle(color: greyColor, fontSize: 16),
            )),
        widthSizedBox(10),
        Flexible(child: Text(t, style: greyST.copyWith(fontSize: 13.5)))
      ],
    );
  }

  Widget dotLine() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 45 / 2),
      child: Column(
        children: List.generate(
            5,
            (index) => Container(
                  height: 5,
                  width: 1,
                  color: greyColor.withOpacity(0.6),
                  margin: const EdgeInsets.only(bottom: 2),
                )),
      ),
    );
  }
}
