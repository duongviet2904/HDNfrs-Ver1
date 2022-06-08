
import 'dart:ui';
import 'package:cat_vs_dog/constants/widget_functions.dart';
import 'package:cat_vs_dog/screens/cucumber_screens/Cucumber_Root.dart';
import 'package:cat_vs_dog/screens/grape_screens/Grape_Root.dart';
import 'package:cat_vs_dog/screens/tomato_screens/Tomato_Root.dart';
import 'package:flutter/material.dart';
import 'package:cat_vs_dog/Animations/FadeAnimation.dart';
import 'package:cat_vs_dog/constants/constants.dart';
import 'package:cat_vs_dog/constants/widget_functions.dart';

class NavigativePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GrapeRootApp()),);
                        }, // Handle your callback
                        child: Ink(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      height: mediaHeight/3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/images/nho-back.jpg"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              colors: [
                                                Colors.black,
                                                Colors.black.withOpacity(.1)
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
                                                          "Grape",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight: FontWeight.w700,),
                                                        ),),
                                                    ],
                                                  ),
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
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TomatoRootApp()),);
                        }, // Handle your callback
                        child: Ink(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      height: mediaHeight/3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/images/cachua-back.jpg"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              colors: [
                                                Colors.black,
                                                Colors.black.withOpacity(.1)
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
                                                          "Tomato",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 30,
                                                              fontWeight: FontWeight.w700),
                                                        ),),
                                                    ],
                                                  ),
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
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CucumberRootApp()),);
                        }, // Handle your callback
                        child: Ink(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      height: mediaHeight/3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/images/cucumber-test-back.jpg"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              colors: [
                                                Colors.black,
                                                Colors.black.withOpacity(.1)
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
                                                          "Cucumber",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 30,
                                                              fontWeight: FontWeight.w700),
                                                        ),),
                                                    ],
                                                  ),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

