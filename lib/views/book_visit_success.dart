import 'package:flutter/material.dart';
import 'package:rentaroof/widgets/buttons.dart';

import '../utils/common.dart';
import '../utils/iamge_constants.dart';
import '../utils/style.dart';

class VisitBookSuccess extends StatefulWidget {
  const VisitBookSuccess({Key? key}) : super(key: key);

  @override
  State<VisitBookSuccess> createState() => _VisitBookSuccessState();
}

class _VisitBookSuccessState extends State<VisitBookSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                  child: Image.asset(ImageConstants.back)),
            ),
            widthSizedBox(15),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Rent Details",
                  style: mainHeadingTS,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 0.5, color: greyColor.withOpacity(0.50)),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Image.asset(ImageConstants.bell),
          ),
        ],
      ),
      // extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: heightSizedBox(0)),
          Image.asset(ImageConstants.bookVisit),
          heightSizedBox(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Renting",
                    style: TextStyle(
                        fontSize: 25,
                        color: greyColor,
                        fontWeight: FontWeight.bold)),
                Text(
                  "Made Easy",
                  style: TextStyle(
                      fontSize: 25,
                      color: primaryBlueColor,
                      fontWeight: FontWeight.bold),
                ),
                heightSizedBox(15),
                Text(
                  "Find the right rental for you and apply online, then handle your lease and payments- all in one place.",
                  style: greyST,
                ),
              ],
            ),
          ),
          Expanded(child: heightSizedBox(0)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                BigButton(
                  onTap: () {},
                  title: "Create an account",
                ),
                heightSizedBox(15),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Already Booked Visit ?",
                    style: greyST,
                  ),
                )
              ],
            ),
          ),
          heightSizedBox(30),
        ],
      ),
    );
  }
}
