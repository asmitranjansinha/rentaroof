import 'package:flutter/material.dart';

import '../Elements/buttons.dart';
import '../Elements/drawer.dart';
import '../Elements/footer_item.dart';
import '../Utils/common.dart';
import '../Utils/iamge_constants.dart';
import '../Utils/style.dart';

class BookVisit extends StatefulWidget {
  const BookVisit({Key? key}) : super(key: key);

  @override
  State<BookVisit> createState() => _BookVisitState();
}

class _BookVisitState extends State<BookVisit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

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
                  child: Image.asset(ImageConstants.back)),
            ),
            widthSizedBox(15),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Book Visit",
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                heightSizedBox(20),
                const Text(
                  "Free Guided\nTour with our Executive",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Name", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: nameController,
                  decoration: inputDecoration(context, hint: "John Martin "),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Email", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: emailController,
                  decoration: inputDecoration(context, hint: "aaa@gmail.com"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Mobile", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "+1 256 2656 152"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Select Date", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "dd-mm-yy"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                Text("Select Time", style: headingTS),
                heightSizedBox(5.0),
                TextFormField(
                  controller: mobileController,
                  decoration: inputDecoration(context, hint: "-- : --"),
                ),
                heightSizedBox(getHeight(context) * 0.03),
                BigButton(onTap: () {}, title: "Schedule a Visit"),
                heightSizedBox(35),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FooterItem(),
          ),
        ],
      ),
    );
  }
}

InputDecoration inputDecoration(BuildContext context,
    {Widget? prefixIcon, String? hint, suffixIcon}) {
  return InputDecoration(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
    hintText: hint,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
    ),
    filled: true,
    fillColor: lightGreyColor,
  );
}
