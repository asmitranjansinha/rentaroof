import 'package:flutter/material.dart';
import 'package:rentaroof/Screens/splash.dart';
import 'package:rentaroof/Utils/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryBlueColor,
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(secondary: primaryBlueColor.withOpacity(0.0)),
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: whiteColor,
            iconTheme: IconThemeData(color: blackColor)),
      ),
      home: const Splash(),
    );
  }
}
