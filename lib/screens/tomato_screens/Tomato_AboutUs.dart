import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cat_vs_dog/constants/Theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String desc =
        "Experienced App Developer (Native/Hybrid) with over 2 years of experience in App Development working on my own projects and freelancing and 5 months plus in Flutter.";

    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5),
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/images/cachua-back.jpg"),
                      fit: BoxFit.cover))),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.9),
                      Colors.black.withOpacity(.4)
                    ]
                )
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "HDNfr Team",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 22
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "HaUI",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22
                                  ),
                                ),
                                IconButton(
                                    icon: Image.asset(
                                      "assets/HaUI.png",
                                      fit: BoxFit.cover,
                                      width: 26,
                                      height: 26,
                                    ),
                                    onPressed: () {}),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80,),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    child: Image.asset(
                      "assets/images/Huy_Avatar.jpg",
                      width: 150,
                      height: 150,
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Nguyễn Đức Huy (Leader)",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                // SizedBox(
                //   height: 13,
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 50),
                //   child: Text(
                //     desc,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         fontSize: 16,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w300),
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                Text("Connect with me", style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          _launchURL("https://www.facebook.com/profile.php?id=100007928490777");
                        },
                        child: Image.asset("assets/images/facebook.png", width: 23,height: 23,)
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        child: Image.asset("assets/images/instagram.png", width: 23,height: 23,)
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        child: Image.asset("assets/images/twitter.png", width: 23,height: 23,)
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  child: Container(

                  ),
                ),
                SizedBox(height: 50,),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    child: Image.asset(
                      "assets/images/Duong_Avatar.jpg",
                      width: 150,
                      height: 150,
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Nguyễn Viết Dương",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                // SizedBox(
                //   height: 13,
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 50),
                //   child: Text(
                //     desc,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         fontSize: 16,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w300),
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                Text("Connect with me", style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          _launchURL("https://www.facebook.com/profile.php?id=100009176435429");
                        },
                        child: Image.asset("assets/images/facebook.png", width: 23,height: 23,)
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        child: Image.asset("assets/images/instagram.png", width: 23,height: 23,)
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        child: Image.asset("assets/images/twitter.png", width: 23,height: 23,)
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  child: Container(
                  ),
                ),

                SizedBox(height: 50,),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    child: Image.asset(
                      "assets/images/Nguyen_Avatar.jpg",
                      width: 150,
                      height: 150,
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Đào Văn Nguyên",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                // SizedBox(
                //   height: 13,
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 50),
                //   child: Text(
                //     desc,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         fontSize: 16,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w300),
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                Text("Connect with me", style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                ),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: (){
                          _launchURL("https://www.facebook.com/profile.php?id=100058264796635");
                        },
                        child: Image.asset("assets/images/facebook.png", width: 23,height: 23,)
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        child: Image.asset("assets/images/instagram.png", width: 23,height: 23,)
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        child: Image.asset("assets/images/twitter.png", width: 23,height: 23,)
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  child: Container(
                  ),
                ),
              ],
            ),
          ),


        ]));
  }
}
