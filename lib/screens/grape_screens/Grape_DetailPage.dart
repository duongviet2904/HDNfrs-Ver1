import 'dart:ui';
import 'package:cat_vs_dog/screens/googleMap.dart';
import 'package:flutter/material.dart';
import 'package:cat_vs_dog/Animations/FadeAnimation.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemData;

  const DetailPage({Key key,@required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('${itemData["image"]}'),
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
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(1, Text("${itemData["name"]}", style:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)
                              ,)),
                            // SizedBox(height: 20,),
                            // Row(
                            //   children: <Widget>[
                            //     FadeAnimation(1.2,
                            //         Text("60 Videos", style: TextStyle(color: Colors.grey, fontSize: 16),)
                            //     ),
                            //     SizedBox(width: 50,),
                            //     FadeAnimation(1.3, Text("240K Subscribers", style:
                            //     TextStyle(color: Colors.grey, fontSize: 16)
                            //       ,))
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1.6,
                          Text("Triệu chứng", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 10,),
                        FadeAnimation(1.6, Text("${itemData["symptom"]}",
                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.6,
                            Text("Nguyên nhân và đặc điểm phát sinh bệnh", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 10,),
                        FadeAnimation(1.6, Text("${itemData["reason"]}",
                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.6,
                            Text("Biện pháp phòng trừ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 10,),
                        FadeAnimation(1.6, Text("${itemData["solution"]}",
                          style: TextStyle(color: Colors.grey, height: 1.4),)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.6,
                            Text("Một số ảnh liên quan", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 20,),
                        FadeAnimation(1.8, Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeVideo(image: '${itemData["relatedImage1"]}'),
                              makeVideo(image: '${itemData["relatedImage2"]}'),
                              makeVideo(image: '${itemData["relatedImage3"]}'),
                              makeVideo(image: '${itemData["relatedImage4"]}'),
                            ],
                          ),
                        )),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              FadeAnimation(1.6,
                                  Text("Xem thêm", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                              ),
                              // SizedBox(height: 5,),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MapSample()));
                                },
                                child: FlatButton(
                                  // style: ElevatedButto
                                  child: new Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, size: 30,),
                                ),
                              ),
                            ],
                          )
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
          // Positioned(
          //   top: 10,
          //   left: 10,
          //   child: OutlinedButton(
          //     style: ElevatedButton.styleFrom(
          //     side: BorderSide(width: 3.0, color: Colors.white),
          //     shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(100.0),
          //     ),
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed('/home');
          //     },
          //     child: new Icon(Icons.arrow_back, color: Colors.white,),
          //     ),
          //     ),
          Positioned(
            top: 20,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3.0, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      child: new Icon(Icons.arrow_back, color: Colors.white,),
                    ),
                  ),
                ],
              ),
          ),
          // Positioned(
          //   bottom: 40,
          //   child: Container(
          //     child: Align(
          //       alignment: Alignment.bottomCenter,
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (context) => MapSample()));
          //         },
          //         child: FlatButton(
          //           // style: ElevatedButto
          //           child: new Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, size: 30,),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
          ],
      ),
    );
  }
  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5/ 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            )
        ),
        // child: Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.bottomRight,
        //           colors: [
        //             Colors.black.withOpacity(.9),
        //             Colors.black.withOpacity(.3)
        //           ]
        //       )
        //   ),
        // ),
      ),
    );
  }
}

