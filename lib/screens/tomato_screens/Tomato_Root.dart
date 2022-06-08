import 'package:cat_vs_dog/screens/tomato_screens/Tomato_LandingPage.dart';
import 'package:cat_vs_dog/screens/tomato_screens/Tomato_AboutUs.dart';
import 'package:cat_vs_dog/screens/tomato_screens/tomato_HomePage.dart';
import 'package:cat_vs_dog/service/Tomato_Service.dart';
import 'package:flutter/material.dart';
import 'package:cat_vs_dog/screens/home.dart';
import 'package:cat_vs_dog/Json/root_app_json.dart';
import 'package:provider/provider.dart';

class TomatoRootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<TomatoRootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TomatoImageClassifyService>(
      create: (context) => TomatoImageClassifyService(),
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: getFooter(),
        body: getBody(),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black,
  //     resizeToAvoidBottomInset: false,
  //     bottomNavigationBar: getFooter(),
  //     body: getBody(),
  //   );
  // }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [HomePage(), LandingPage(), AboutUs()],
    );
  }

  Widget getFooter() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index]['icon'],
                    color: activeTab == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    items[index]['text'],
                    style: TextStyle(
                        fontSize: 13,
                        color: activeTab == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5)),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
