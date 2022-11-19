import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentaroof/Utils/iamge_constants.dart';

import '../Elements/buttons.dart';
import '../Utils/common.dart';
import '../Utils/style.dart';
import 'dash_board2.dart';
import 'forgor_password.dart';
import 'signup.dart';

class LoginWidget2 extends StatefulWidget {
  const LoginWidget2({super.key});

  @override
  State<LoginWidget2> createState() => _LoginWidget2State();
}

class _LoginWidget2State extends State<LoginWidget2> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController mMobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: getHeight(context) / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                image: const DecorationImage(
                  image: AssetImage(ImageConstants.loginScreenBg),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(appIcon, height: 75,),
                  heightSizedBox(20),
                  Image.asset(ImageConstants.logoText, height: 18),
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
            margin: EdgeInsets.only(top: getHeight(context) / 3),
            child: Form(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(ImageConstants.loginText, height: 23)),
                  heightSizedBox(getHeight(context) * 0.03),
                  Text("Email", style: headingTS),
                  heightSizedBox(5.0),
                  TextFormField(
                    controller: mMobileController,
                    decoration:
                        inputDecoration(context, hint: "Enter Email / Mobile"),
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
                        child: Image.asset(ImageConstants.eye, height: 17),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            navigationPush(context, const ForgotPassword()),
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(color: greyColor),
                        ),
                      ),
                    ],
                  ),
                  heightSizedBox(getHeight(context) * 0.04),
                  BigButton(
                      onTap: () => navigationRemoveUntil(
                          context, DashBoard(selectedPos: 2)),
                      title: "Login"),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Or",
                        style: TextStyle(color: greyColor, fontSize: 18)),
                  ),
                  BigButton(
                    onTap: () =>
                        navigationPush(context, DashBoard(selectedPos: 0)),
                    title: "Request OTP",
                    color: primaryYellowColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(color: greyColor),
                      ),
                      TextButton(
                        onPressed: () =>
                            navigationPush(context, const SignUpWidget()),
                        child: Text(
                          "Sign Up",
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
