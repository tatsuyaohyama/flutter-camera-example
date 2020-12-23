import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final ImagePicker _picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: _image != null
                  ? Image.file(_image)
                  : Center(
                      child: Text('No Image'),
                    ),
            ),
            FlatButton(
              child: Text('カメラを起動'),
              onPressed: () async {
                getImageFromCamera();
              },
            ),
            FlatButton(
              child: Text('アルバムから選択'),
              onPressed: () async {
                getImageFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }
}
