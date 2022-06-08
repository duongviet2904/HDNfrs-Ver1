import 'package:flutter/material.dart';
import 'package:cat_vs_dog/Json/Grape_Diseases.dart';
import 'package:cat_vs_dog/screens/grape_screens/Grape_DetailPage.dart';
import 'package:cat_vs_dog/constants/constants.dart';
import 'package:cat_vs_dog/constants/custom_functions.dart';
import 'package:cat_vs_dog/constants/widget_functions.dart';
import 'package:cat_vs_dog/custom/BorderIcon.dart';
import 'package:cat_vs_dog/custom/OptionButton.dart';

import 'package:cat_vs_dog/Animations/FadeAnimation.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
          body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child:
                      FadeAnimation(0.3,Text(
                        "Một số bệnh thường gặp:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                      ),)
                    ),
                    Padding(
                        padding: sidePadding,
                        child: Divider(
                          height: 25,
                          color: COLOR_GREY,
                        )),
                    addVerticalSpace(10),
                    Expanded(
                      child: Padding(
                        padding: sidePadding,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: Grape_Diseases.length,
                            itemBuilder: (context, index) {
                              return RealEstateItem(
                                itemData: Grape_Diseases[index],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTime = "August 17, 2021";
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
              itemData: itemData,
            )));
      },
      child: Container(

        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(itemData["image"]),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(.3)
                                ]
                            ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                               padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      FadeAnimation(1.0,
                                        Text(
                                          "${itemData["name"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ),),
                                      FadeAnimation(0.8,
                                        Text(
                                          " ${dateTime}",
                                          overflow: TextOverflow.ellipsis,
                                          style: themeData.textTheme.bodyText2,
                                        ),),
                                    ],
                                  ),
                                  addVerticalSpace(10),
                                  FadeAnimation(1.0,
                                    Text(
                                      "${itemData["shortDes"]}",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ),
                  ],
                ),

            // addVerticalSpace(15),
            // Row(
            //   children: [
            //     Text(
            //       "${itemData["name"]}",
            //       style: themeData.textTheme.headline1,
            //     ),
            //   ],
            // ),
            // addVerticalSpace(10),
            // Text(
            //   "${itemData["shortDes"]}",
            //   style: themeData.textTheme.headline5,
            // ),
            // addVerticalSpace(5),
            // Text(
            //   "${dateTime}",
            //   style: themeData.textTheme.bodyText2,
            // ),
          ],
        ),
      ),
    );
  }
}
