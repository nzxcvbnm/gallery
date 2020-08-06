import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<FirstPage> {
  static int i = 1;
  static StorageReference ref =
      FirebaseStorage.instance.ref().child('images').child('image$i.jpg');
  Uint8List imageFile;

  int max = 7 * 1024 * 1024;

  getImage() {
    ref.getData(max).then((data) {
      this.setState(() {
        imageFile = data;
      });
      i++;
    });
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: ListView(
        children: <Widget>[Widgett(imageFile)],
      ),
    );
  }
}

class Widgett extends StatelessWidget {
  Uint8List imageFile;

  Widgett(this.imageFile);

  @override
  Widget build(BuildContext context) {
    if (imageFile == null) return Center(child: CircularProgressIndicator());
    return Container(child: Image.memory(imageFile));
  }
}
