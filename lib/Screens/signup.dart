import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/Utils/iamge_constants.dart';

import '../Elements/buttons.dart';
import '../Utils/common.dart';
import '../Utils/style.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();
  String? profileValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0.0, backgroundColor: transparentColor),
      body: Stack(
        children: [
          Container(
            // height: getHeight(context) / 5,
            // margin: EdgeInsets.only(top: getTop(context)),
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              image: const DecorationImage(
                image: AssetImage(ImageConstants.signUpScreenBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: AppBar().preferredSize.height + getTop(context),
                  left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(ImageConstants.signUpText),
                  heightSizedBox(10),
                  Text(
                    "Hello, Welcome back to your account.",
                    style: headingTS,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: getHeight(context) * 0.80,
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 3,
                    offset: const Offset(-0.1, -0.1)),
              ],
            ),
            margin: EdgeInsets.only(top: getHeight(context) / 4),
            child: Form(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                children: [
                  heightSizedBox(getHeight(context) * 0.03),
                  Text("Name", style: headingTS),
                  heightSizedBox(5.0),
                  TextFormField(
                    controller: nameController,
                    decoration: inputDecoration(context, hint: "John Martin"),
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
                    decoration:
                        inputDecoration(context, hint: "+1 256 2656 152"),
                  ),
                  heightSizedBox(getHeight(context) * 0.03),
                  Text("Password", style: headingTS),
                  heightSizedBox(5.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: inputDecoration(
                      context,
                      hint: "**********",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: SvgPicture.asset(
                          eye,
                          height: 17,
                        ),
                      ),
                    ),
                  ),
                  heightSizedBox(getHeight(context) * 0.03),
                  Text("Referral Code", style: headingTS),
                  heightSizedBox(5.0),
                  TextFormField(
                    controller: referralCodeController,
                    decoration: inputDecoration(context, hint: "FG5662A"),
                  ),
                  heightSizedBox(getHeight(context) * 0.03),
                  Text("Choose your profile ", style: headingTS),
                  heightSizedBox(5.0),
                  Row(
                    children: [
                      Radio(
                          value: "Tenant",
                          groupValue: profileValue,
                          activeColor: primaryBlueColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (v) => setState(() => profileValue = v)),
                      Text(
                        "Tenant",
                        maxLines: 2,
                        style: headingTS,
                      ),
                      widthSizedBox(20.0),
                      Radio(
                          value: "landload",
                          groupValue: profileValue,
                          activeColor: primaryBlueColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (v) => setState(() => profileValue = v)),
                      Text(
                        "landload",
                        maxLines: 2,
                        style: headingTS,
                      ),
                    ],
                  ),
                  heightSizedBox(getHeight(context) * 0.04),
                  BigButton(onTap: () {}, title: "Sign Up"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(color: greyColor),
                      ),
                      TextButton(
                        onPressed: () => navigationPop(context),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: primaryBlueColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
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
