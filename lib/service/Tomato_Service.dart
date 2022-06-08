import 'dart:io';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
//import 'package:image/image.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:sklite/SVM/SVM.dart';
import 'package:sklite/utils/io.dart' as io;
import 'dart:convert';





class TomatoImageClassifyService extends ChangeNotifier {
  TomatoImageClassifyService() {
    loadModel();
  }

  File image;
  //each item in _output is a Map : keys(index,label,confidence)
  List output;
  SVC svc;
  final _picker = ImagePicker();

  Future loadModel() async {
     await Tflite.loadModel(
      model: 'assets/tflite/Tomato_Model_Unquant.tflite',
      labels: 'assets/tflite/Tomato_Label.txt',

    );
  }

  Future pickImage() async {
    var _image = await _picker.getImage(
      source: ImageSource.camera,
    );
    if (_image == null) return null;

    this.image = File(_image.path);

    ;
    //Image x = decodeJpg((this.image).readAsBytesSync());

    classifyImage(this.image);
  }

  Future pickGalleryImage() async {
    var _image = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (_image == null) return null;

    this.image = File(_image.path);


    //Image image = decodeJpg(File('test.jpg').readAsBytesSync());

    classifyImage(this.image);
  }



  // Image rgbAlpha(Image image) {
  //   // Make sure the image uses the alpha channel.
  //   image.channels = Channels.rgb;
  //   // Map the luminance (grayscale) of the image to the alpha channel.
  //   return remapColors(image);
  // }


  Future classifyImage(File image) async {
    // var temp;
    // ImageProcessor imageProcessor = ImageProcessorBuilder()
    //     .add(ResizeOp(128, 128, ResizeMethod.NEAREST_NEIGHBOUR))
    //     .build();
    // TensorImage tensorImage = TensorImage.fromFile(this.image);
    // tensorImage = imageProcessor.process(tensorImage);
    // TensorBuffer probabilityBuffer =
    //   TensorBuffer.createFixedSize(<int>[1, 512], TfLiteType.uint8);
    //
    // //var interpreterOptions = InterpreterOptions()..useNnApiForAndroid = true;
    //
    // try {
    //   // Create interpreter from asset.
    //   Interpreter interpreter =
    //   await Interpreter.fromAsset("feature_extractor.tflite");
    //   interpreter.run(tensorImage.buffer, probabilityBuffer.buffer);
    //   temp = probabilityBuffer.getDoubleList();
    //   print(temp);
    //   print(probabilityBuffer.buffer);
    // } catch (e) {
    //   print('Error loading model: ' + e.toString());
    // }



    // io.loadModel("assets/tflite/my_svm.json").then((x) {
    //   this.svc = SVC.fromMap(json.decode(x));
    // });
    // print(svc.predict(temp));



    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.5,
      imageStd: 127.5,
      imageMean: 127.5,
    );

    this.output = output;
    print(output);
    notifyListeners();
    // _loading = false;
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
