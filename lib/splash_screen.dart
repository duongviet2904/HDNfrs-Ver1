// import 'dart:ui';
//
// import 'package:cat_vs_dog/screens/home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:splashscreen/splashscreen.dart';
//
// class MySplashScreen extends StatefulWidget {
//   @override
//   _MySplashScreenState createState() => _MySplashScreenState();
// }
//
// class _MySplashScreenState extends State<MySplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => GrapeRootApp()),);
//             }, // Handle your callback
//             child: Ink(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         child: Container(
//                           height: mediaHeight/3,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/images/nho-back.jpg"),
//                                   fit: BoxFit.cover
//                               )
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   begin: Alignment.bottomRight,
//                                   colors: [
//                                     Colors.black,
//                                     Colors.black.withOpacity(.1)
//                                   ]
//                               ),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(10),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           FadeAnimation(1.0,
//                                             Text(
//                                               "Grape",
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 30,
//                                                 fontWeight: FontWeight.w700,),
//                                             ),),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => TomatoRootApp()),);
//             }, // Handle your callback
//             child: Ink(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         child: Container(
//                           height: mediaHeight/3,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/images/cachua-back.jpg"),
//                                   fit: BoxFit.cover
//                               )
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   begin: Alignment.bottomRight,
//                                   colors: [
//                                     Colors.black,
//                                     Colors.black.withOpacity(.1)
//                                   ]
//                               ),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(10),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           FadeAnimation(1.0,
//                                             Text(
//                                               "Tomato",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 30,
//                                                   fontWeight: FontWeight.w700),
//                                             ),),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CucumberRootApp()),);
//             }, // Handle your callback
//             child: Ink(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         child: Container(
//                           height: mediaHeight/3,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/images/cucumber-test-back.jpg"),
//                                   fit: BoxFit.cover
//                               )
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   begin: Alignment.bottomRight,
//                                   colors: [
//                                     Colors.black,
//                                     Colors.black.withOpacity(.1)
//                                   ]
//                               ),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(10),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           FadeAnimation(1.0,
//                                             Text(
//                                               "Cucumber",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 30,
//                                                   fontWeight: FontWeight.w700),
//                                             ),),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
