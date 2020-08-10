import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'button.dart';

class Picture extends StatelessWidget {
  final File image;

  const Picture({Key key, this.image}) : super(key: key);

  addImage() async {
    final StorageReference ref =
        FirebaseStorage.instance.ref().child('images').child('image0.jpg');
    StorageUploadTask uploadTask = ref.putFile(image);
    String downloadUrl =
        await (await uploadTask.onComplete).ref.getDownloadURL();
    Firestore.instance.collection('images').add({"url": downloadUrl});
  }

  added() {
    return Center(
      child: Text('added',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.file(image),
          ),
          CameraButton(() => addImage()),
        ],
      ),
    );
  }
}
