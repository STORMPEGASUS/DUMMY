import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ImagePicker imagePicker;
  File? _image;
  dynamic objectDetector;
  _imgFromCamera() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      doObjectDetection();
    }
  }

  _imgFromGallery() async {
    XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      doObjectDetection();
    }
  }

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();

    const mode = DetectionMode.single;
    final options = ObjectDetectorOptions(
        mode: mode, classifyObjects: true, multipleObjects: true);
    objectDetector = ObjectDetector(options: options);
  }

  @override
  void dispose() {
    super.dispose();
  }

  doObjectDetection() async {
    InputImage inputImage = InputImage.fromFile(_image!);
    final List<DetectedObject> objects =
        await objectDetector.processImage(inputImage);

    for (DetectedObject detectedObject in objects) {
      final rect = detectedObject.boundingBox;
      final trackingId = detectedObject.trackingId;

      for (Label label in detectedObject.labels) {
        print('${label.text} ${label.confidence}');
      }
    }
    setState(() {
      _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('IMAGES/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              width: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: ElevatedButton(
                      onLongPress: _imgFromCamera,
                      onPressed: _imgFromGallery,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: _image != null
                            ? Image.file(
                                _image!,
                                width: 350,
                                height: 350,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                width: 350,
                                height: 350,
                                color: Colors.pinkAccent,
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                  size: 100,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
