import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SecondPage extends StatefulWidget {
  @override
  SecondState createState() => SecondState();
}

class SecondState extends State<SecondPage> {
  static File image;

  Future pickImage() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(tempImage.path);
    });
  }

  addImage() async {
    final StorageReference ref =
        FirebaseStorage.instance.ref().child('images').child('image4.jpg');
    StorageUploadTask uploadTask = ref.putFile(image);
    String downloadUrl =
        await (await uploadTask.onComplete).ref.getDownloadURL();
    Firestore.instance.collection('images').add({"url": downloadUrl});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: ListView(
          children: <Widget>[
            image == null ? Text("pick image") : enableUpload(),
            RaisedButton(
                child: Text('pick image'),
                color: Colors.amberAccent,
                onPressed: pickImage),
          ],
        ));
  }

  static int i = 0;
  Widget enableUpload() {
    if (image == null) return CircularProgressIndicator();
    i++;
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        RaisedButton(
            child: Text('upload'),
            onPressed: () {
              addImage();
            })
      ],
    );
  }
}
