import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/buttons.dart';
import '../widgets/drawer.dart';
import '../utils/common.dart';
import '../utils/iamge_constants.dart';
import '../utils/style.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  List<String> genderList = ['Male', 'Female', 'Other'];
  String? gender;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: lightGreyColor,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: lightGreyColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
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
            widthSizedBox(15),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Profile",
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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                color: whiteColor,
                margin: const EdgeInsets.only(top: 65),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 60),
                      child: const Text(
                        "John Martin",
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("First Name", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: nameController,
                      decoration: inputDecoration(context, hint: "John"),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("Last Name", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: nameController,
                      decoration: inputDecoration(context, hint: "Martin"),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("Email", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: emailController,
                      decoration:
                          inputDecoration(context, hint: "aaa@gmail.com"),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("Mobile", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: mobileController,
                      decoration:
                          inputDecoration(context, hint: "+1 256 2656 152"),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("Gender", style: headingTS),
                    heightSizedBox(5.0),
                    InputDecorator(
                      decoration:
                          inputDecoration(context, hint: "Select gender"),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: const TextStyle(color: Colors.black),
                          value: gender,
                          isDense: true,
                          hint: const Text('Select Gender'),
                          icon: Icon(
                            Icons.keyboard_arrow_down, // Add this
                            color: greyColor, // Add this
                          ),
                          onChanged: (String? v) => setState(() => gender = v),
                          items: genderList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("Address", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: mobileController,
                      decoration: inputDecoration(context, hint: "15 USA"),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Row(
                      children: [
                        Text("Mobile Status :", style: headingTS),
                        widthSizedBox(15),
                        Text("Not Verified",
                            style: headingTS.copyWith(color: Colors.red)),
                      ],
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    const Divider(),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("Current Password", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: mobileController,
                      decoration: inputDecoration(context, hint: ""),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("New Password", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: mobileController,
                      decoration: inputDecoration(context, hint: ""),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    Text("Confirm Password", style: headingTS),
                    heightSizedBox(5.0),
                    TextFormField(
                      controller: mobileController,
                      decoration: inputDecoration(context, hint: ""),
                    ),
                    heightSizedBox(getHeight(context) * 0.03),
                    BigButton(onTap: () {}, title: "Update"),
                    heightSizedBox(25),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: greyColor,
                            highlightColor: Colors.grey.shade700,
                            child: const SizedBox(height: double.infinity),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: primaryYellowColor),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(ImageConstants.home)),
                  ],
                ),
              ),
            ],
          )
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
