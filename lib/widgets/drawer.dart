import 'package:flutter/material.dart';
import 'package:rentaroof/views/book_visit.dart';
import 'package:rentaroof/views/book_visit_success.dart';
import 'package:rentaroof/views/contact_support.dart';
import 'package:rentaroof/views/login.dart';
import 'package:rentaroof/utils/iamge_constants.dart';
import 'package:rentaroof/utils/style.dart';

import '../views/refer_n_earn.dart';
import '../utils/common.dart';
import 'buttons.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        // width: 230,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              InkWell(
                // onTap: () => navigationWidgetPush(context, UserProfile()),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  color: primaryBlueColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  ImageConstants.personImg,
                                  height: 35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              widthSizedBox(5.0),
                              Text(
                                "Hello, Guest!",
                                style: whiteHeadingTS,
                              ),
                            ],
                          ),
                          MyOutlinedButton(
                            onTap: () => navigationRemoveUntil(
                                context, const LoginWidget2()),
                            label: 'Login/register',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: middleGreyColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: const Text(
                  "Looking to rent?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              createDrawerBodyItem(
                text: 'Explore properties/localities',
                imagePath: ImageConstants.sideBar1,
                // onTap: () => navigationWidgetPush(context, Orders()),
              ),
              createDrawerBodyItem(
                text: 'Featured properties',
                imagePath: ImageConstants.sideBar2,
                // onTap: () =>
                //     navigationWidgetPush(context, OrdersTrackingBuyer()),
              ),
              createDrawerBodyItem(
                text: 'Book visits',
                imagePath: ImageConstants.sideBar3,
                onTap: () {
                  navigationPop(context);
                  navigationPush(context, const BookVisit());
                },
              ),
              createDrawerBodyItem(
                text: 'How to use/Learn more',
                imagePath: ImageConstants.sideBar4,
                onTap: () {
                  navigationPop(context);
                  navigationPush(context, const VisitBookSuccess());
                },
              ),
              Container(
                color: middleGreyColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: const Text(
                  "Looking to rent out?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              createDrawerBodyItem(
                text: 'Post property for free',
                imagePath: ImageConstants.sideBar5,
                // onTap: () => navigationWidgetPush(context, FindJobs()),
              ),
              createDrawerBodyItem(
                text: 'Property management services',
                imagePath: ImageConstants.sideBar6,
                // onTap: () => navigationWidgetPush(context, PostOnlineBidding()),
              ),
              Container(
                height: 0.3,
                color: greyColor.withOpacity(0.4),
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
              createDrawerBodyItem(
                text: 'Home Services',
                imagePath: ImageConstants.sideBar7,
                // onTap: () => navigationWidgetPush(context, MySettings()),
              ),
              createDrawerBodyItem(
                text: 'Contact support',
                imagePath: ImageConstants.sideBar8,
                onTap: () {
                  navigationPop(context);
                  navigationPush(context, const ContactSupport());
                },
              ),
              createDrawerBodyItem(
                text: 'Rate us',
                imagePath: ImageConstants.sideBar9,
                // onTap: () => navigationWidgetPush(context, HTMLTextPage(i: 2)),
              ),
              createDrawerBodyItem(
                text: 'Refer & Earn',
                imagePath: ImageConstants.sideBar10,
                onTap: () {
                  navigationPop(context);
                  navigationPush(context, const ReferNEarn());
                },
              ),
              createDrawerBodyItem(
                text: 'Settings',
                imagePath: ImageConstants.sideBar11,
                // onTap: () => navigationWidgetPush(context, HTMLTextPage(i: 4)),
              ),
              heightSizedBox(25)
            ],
          ),
        ),
      ),
    );
  }
}

Widget createDrawerBodyItem(
    {String? imagePath,
    required String text,
    GestureTapCallback? onTap,
    Color? color}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        tileColor: whiteColor,
        title: Row(
          children: [
            Image.asset(
              imagePath ?? '',
              height: 25,
            ),
            widthSizedBox(12.0),
            Flexible(
              child: Text(
                text,
                style: mainHeadingTS.copyWith(fontSize: 13),
                maxLines: 2,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    ],
  );
}
