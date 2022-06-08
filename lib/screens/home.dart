// import 'dart:io';
//
// import 'package:cat_vs_dog/service/Cucumber_Service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
//
// class Home extends StatelessWidget {
//   final backgroudColor = Colors.white;
//   var _currentIndex = 0;
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
//               height: 30,
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
//           ],
//         ),
//       ),
//     );
//   }
//   }
//
