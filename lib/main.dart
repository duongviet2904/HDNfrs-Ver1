import 'dart:io';
import 'dart:ui';
import 'package:cat_vs_dog/screens/cucumber_screens/Cucumber_LandingPage.dart';
import 'package:cat_vs_dog/service/Cucumber_Service.dart';
import 'package:cat_vs_dog/screens/home.dart';
import 'package:cat_vs_dog/screens/onboarding.dart';
import 'package:cat_vs_dog/screens/cucumber_screens/Cucumber_DetailPage.dart';
import 'package:cat_vs_dog/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cat_vs_dog/screens/cucumber_screens/Cucumber_Root.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider<ImageClassifyService>(
//       create: (context) => ImageClassifyService(),
//       child: MyApp(),
//     ),
//   );
// }

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Welcome to HDNFr!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: COLOR_WHITE, accentColor: COLOR_DARK_BLUE, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat"),
      home: Onboarding(),
    );
  }
}
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS)
//       return CupertinoApp(
//         home: MySplashScreen(),
//         debugShowCheckedModeBanner: false,
//         title: 'HDNFriends',
//       );
//     else
//       return MaterialApp(
//         title: 'HDNFriends',
//         home: MySplashScreen(),
//         debugShowCheckedModeBanner: false,
//       );
//   }
// }
