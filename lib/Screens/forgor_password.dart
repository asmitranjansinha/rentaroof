import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/Utils/iamge_constants.dart';

import '../Elements/buttons.dart';
import '../Utils/common.dart';
import '../Utils/style.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mMobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          heightSizedBox(AppBar().preferredSize.height + getTop(context)),
          SvgPicture.asset(forgotPassword),
          heightSizedBox(30),
          Text("Forgot",
              style: TextStyle(
                  fontSize: 25, color: greyColor, fontWeight: FontWeight.bold)),
          Text("Password?",
              style: TextStyle(
                  fontSize: 25,
                  color: primaryBlueColor,
                  fontWeight: FontWeight.bold)),
          heightSizedBox(15),
          Text(
              "Don’t worry! It happens. Please enter the address associated with your account.",
              style: TextStyle(fontSize: 14, color: greyColor)),
          heightSizedBox(getHeight(context) * 0.03),
          Text("Email", style: headingTS),
          heightSizedBox(5.0),
          TextFormField(
            controller: mMobileController,
            decoration: inputDecoration(context, hint: "aaa@gmail.com"),
          ),
          heightSizedBox(getHeight(context) * 0.03),
          BigButton(
            onTap: () {},
            title: "Submit",
          )
        ],
      ),
    );
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
}
