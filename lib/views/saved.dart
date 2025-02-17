import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/widgets/saved_item.dart';

import '../widgets/drawer.dart';
import '../utils/common.dart';
import '../utils/iamge_constants.dart';
import '../utils/style.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
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
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: SvgPicture.asset(menu)),
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
            child: SvgPicture.asset(notification),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 7,
          childAspectRatio: 0.9,
        ),
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SavedItem(i: index);
        },
      ),
    );
  }
}
