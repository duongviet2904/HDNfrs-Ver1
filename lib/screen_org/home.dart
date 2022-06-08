// import 'dart:io';
//
// import 'package:cat_vs_dog/service/Cucumber_Service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
//
// class Home extends StatelessWidget {
//   final backgroudColor = Colors.white;
//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS)
//       return CupertinoPageScaffold(
//         backgroundColor: backgroudColor,
//         child: SafeArea(
//           child: HomeBody(),
//         ),
//       );
//     else
//       return Scaffold(
//         backgroundColor: backgroudColor,
//         body: SingleChildScrollView(
//           child: HomeBody(),
//         ),
//       );
//   }
// }
//
// class HomeBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var _imageService = Provider.of<ImageClassifyService>(context);
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 24,
//       ),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Text(
//               "Welcome To HDNfrs' Project",
//               style: TextStyle(
//                 fontSize: 50,
//                 color: Colors.black,
//
//               ),
//             ),
//             Text(
//               'TeachableMachine.com CNN',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black26,
//               ),
//             ),
//             SizedBox(
//               height: 6,
//             ),
//             Text(
//               'Detect Cucumber Leaves',
//               style: TextStyle(
//                 fontSize: 30,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               alignment: Alignment.center,
//               child: Consumer<ImageClassifyService>(
//                   builder: (context, value, child) {
//                 if (value.image == null || value.output == null) {
//                   return Column(
//                     children: [
//                       Image.asset('assets/cat.png'),
//                       SizedBox(
//                         height: 40,
//                       ),
//                     ],
//                   );
//                 } else if (value.output != null) {
//                   return Column(
//                     children: [
//                       Container(
//                         height: 250,
//                         child: Image.file(
//                           value.image,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         '${value.output[0]['label']}',
//                         style: TextStyle(
//                           color: Colors.black45,
//                           fontSize: 20,
//                         ),
//                       )
//                     ],
//                   );
//                 } else
//                   return Container();
//               }),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   OutlinedButton(
//                     style: ElevatedButton.styleFrom(
//                       side: BorderSide(width: 3.0, color: Colors.black),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     onPressed: _imageService.pickGalleryImage,
//                     child: Text(
//                       'Choose a photo',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 13,
//                   ),
//
//                   OutlinedButton(
//                     style: ElevatedButton.styleFrom(
//                       side: BorderSide(width: 3.0, color: Colors.black),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                     onPressed: _imageService.pickImage,
//                     child: Text(
//                       'Camera Roll',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Text(
//               'Some common diseases in cucumber plants:',
//               style: TextStyle(
//                 fontSize: 30,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.all(5),
//                 alignment: Alignment.center,
//                 constraints: BoxConstraints.expand(
//                     height: 225
//                 ),
//                 child: imageSlider(context)),
//             SizedBox(
//               height: 50,
//             ),
//           Container(
//               height: 200,
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
//                 BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
//               ]),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           // post["name"],
//                           "hihi",
//                           style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           // post["brand"],
//                           "haha",
//                           style: const TextStyle(fontSize: 17, color: Colors.grey),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           // "\$ ${post["price"]}",
//                           "huhu",
//                           style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                     Image.asset(
//                       // "assets/images/${post["image"]}",
//                       "assets/app_icon.png",
//                       height: double.infinity,
//                     )
//                   ],
//                 ),
//               )),
//           ],
//         ),
//       ),
//     );
//   }
//   Swiper imageSlider(context){
//     return new Swiper(
//       autoplay: true,
//       itemBuilder: (BuildContext context, int index) {
//         return new Image.network(
//           "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
//           fit: BoxFit.fitHeight,
//         );
//       },
//       itemCount: 10,
//       viewportFraction: 0.7,
//       scale: 0.8,
//     );
//   }
// }
