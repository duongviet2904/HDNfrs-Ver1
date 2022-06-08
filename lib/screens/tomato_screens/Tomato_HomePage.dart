// import 'dart:html';
import 'dart:io';
import 'package:cat_vs_dog/Animations/FadeAnimation.dart';
import 'package:cat_vs_dog/Json/Tomato_Diseases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:cat_vs_dog/service/Tomato_Service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cat_vs_dog/screens/tomato_screens/Tomato_DetailPage.dart';
import 'package:simple_animations/simple_animations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody() {
    var _imageService = Provider.of<TomatoImageClassifyService>(context);
    var size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height*0.8,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/cachua-back.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          height: size.height*0.8,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(1),
                                    Colors.black.withOpacity(0.00),
                                  ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter))),
                      Container(
                        height: 550,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeAnimation(0.5,
                              Text(
                                "Carefully take care of your plants!",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                ),
                              ),),
                            SizedBox(
                              height: 15,
                            ),
                            FadeAnimation(0.5,
                              Text(
                                "Detect Tomato Leaves",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white70
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2.0, color: Colors.white70),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: _imageService.pickGalleryImage,
                                  child: Text(
                                    'Choose a photo',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),

                                OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2.0, color: Colors.white70),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: _imageService.pickImage,
                                  child: Text(
                                    '  Camera Roll  ',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30,),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Consumer<TomatoImageClassifyService>(
                                      builder: (context, value, child) {
                                        if (value.image == null || value.output == null) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          );
                                        } else if (value.output != null) {
                                          return Column(
                                            children: [
                                              Text("Your Image:",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          );
                                        } else
                                          return Container();
                                      }
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Consumer<TomatoImageClassifyService>(
                            builder: (context, value, child) {
                              if (value.image == null || value.output == null) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              } else if (value.output != null) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 250,
                                      child: Image.file(
                                        value.image,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Kết quả:",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Bệnh ${value.output[0]['label']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Độ tin cậy : ${(value.output[0]['confidence']*100).toStringAsPrecision(4)}%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );
                              } else
                                return Container();
                            }
                        ),
                      ],
                    ),
                  ),
                  Align(
                    child: Column(
                      children: [
                        Consumer<TomatoImageClassifyService>(
                            builder: (context, value, child) {
                              if (value.image == null || value.output == null) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              } else if (value.output != null &&
                                  value.output[0]['label'] == "Bacterial spot") {
                                return Stack(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Một số ảnh liên quan",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70
                                          ),),
                                        SizedBox(height: 20,),
                                        CarouselSlider(
                                          items: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BacterialSpot1.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BacterialSpot2.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BacterialSpot3.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BacterialSpot4.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                          ],
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            viewportFraction: 0.85,
                                            aspectRatio: 16/9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            autoPlayAnimationDuration: Duration(milliseconds: 700),
                                            enableInfiniteScroll: true,
                                            initialPage: 2,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Triệu chứng", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[0]["symptom"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Nguyên nhân và đặc điểm phát sinh bệnh", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[0]["reason"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Biện pháp phòng trừ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[0]["solution"]}",),),
                                        SizedBox(height: 20,),
                                        Text("Chi tiết",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70
                                          ),),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => DetailPage(
                                                  itemData: Tomato_Diseases[0],
                                                )));
                                          },
                                          child: FlatButton(
                                            // style: ElevatedButto
                                            child: new Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, size: 30,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }else if (value.output != null &&
                                  value.output[0]['label'] == "Black mold") {
                                return Stack(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Một số ảnh liên quan",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70
                                          ),),
                                        SizedBox(height: 20,),
                                        CarouselSlider(
                                          items: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BlackMold1.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BlackMold2.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BlackMold3.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/BlackMold4.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                          ],
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            viewportFraction: 0.85,
                                            aspectRatio: 16/9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            autoPlayAnimationDuration: Duration(milliseconds: 700),
                                            enableInfiniteScroll: true,
                                            initialPage: 2,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Triệu chứng", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[1]["symptom"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Nguyên nhân và đặc điểm phát sinh bệnh", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[1]["reason"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Biện pháp phòng trừ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[1]["solution"]}",),),
                                        SizedBox(height: 20,),
                                        Text("Chi tiết",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70
                                          ),),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => DetailPage(
                                                  itemData: Tomato_Diseases[1],
                                                )));
                                          },
                                          child: FlatButton(
                                            // style: ElevatedButto
                                            child: new Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, size: 30,),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                );
                              }else if (value.output != null &&
                                  value.output[0]['label'] == "Gray rot") {
                                return Stack(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Một số ảnh liên quan",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70
                                          ),),
                                        SizedBox(height: 20,),
                                        CarouselSlider(
                                          items: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/GrayRot1.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/GrayRot2.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/GrayRot3.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/GrayRot4.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                          ],
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            viewportFraction: 0.85,
                                            aspectRatio: 16/9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            autoPlayAnimationDuration: Duration(milliseconds: 700),
                                            enableInfiniteScroll: true,
                                            initialPage: 2,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Triệu chứng", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[2]["symptom"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Nguyên nhân và đặc điểm phát sinh bệnh", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[2]["reason"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Biện pháp phòng trừ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[2]["solution"]}",),),
                                        SizedBox(height: 20,),
                                        Text("Chi tiết",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70
                                          ),),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => DetailPage(
                                                  itemData: Tomato_Diseases[2],
                                                )));
                                          },
                                          child: FlatButton(
                                            child: new Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, size: 30,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }else if (value.output != null &&
                                  value.output[0]['label'] == "Leaf mold") {
                                return Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Text("Một số ảnh liên quan",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70
                                          ),),
                                        SizedBox(height: 20,),
                                        CarouselSlider(
                                          items: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/LeafMold1.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/LeafMold2.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/LeafMold3.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/LeafMold4.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                          ],
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            viewportFraction: 0.85,
                                            aspectRatio: 16/9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            autoPlayAnimationDuration: Duration(milliseconds: 700),
                                            enableInfiniteScroll: true,
                                            initialPage: 2,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Triệu chứng", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[4]["symptom"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Nguyên nhân và đặc điểm phát sinh bệnh", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[4]["reason"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Biện pháp phòng trừ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[4]["solution"]}",),),
                                        SizedBox(height: 20,),
                                        Text("Chi tiết",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70
                                          ),),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => DetailPage(
                                                  itemData: Tomato_Diseases[4],
                                                )));
                                          },
                                          child: FlatButton(
                                            child: new Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, size: 30,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }else if (value.output != null &&
                                  value.output[0]['label'] == "Powdery mildew") {
                                return Stack(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Một số ảnh liên quan",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70
                                          ),),
                                        SizedBox(height: 20,),
                                        CarouselSlider(
                                          items: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/PowderyMildew1.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/PowderyMildew2.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/PowderyMildew3.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/tomato/PowderyMildew4.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                          ],
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage: true,
                                            viewportFraction: 0.85,
                                            aspectRatio: 16/9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            autoPlayAnimationDuration: Duration(milliseconds: 700),
                                            enableInfiniteScroll: true,
                                            initialPage: 2,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Triệu chứng", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[5]["symptom"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Nguyên nhân và đặc điểm phát sinh bệnh", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[5]["reason"]}",
                                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                                        SizedBox(height: 20,),
                                        FadeAnimation(1.6,
                                            Text("Biện pháp phòng trừ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                        ),
                                        SizedBox(height: 10,),
                                        FadeAnimation(1.6, Text("${Tomato_Diseases[5]["solution"]}",),),
                                        SizedBox(height: 20,),
                                        Text("Chi tiết",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70
                                          ),),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => DetailPage(
                                                  itemData: Tomato_Diseases[5],
                                                )));
                                          },
                                          child: FlatButton(
                                            child: new Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, size: 30,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                              else
                                return Container();
                            }
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
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
                                "HDNfr",
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
          ],
        ),
      ),
    );
  }
}
