import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:camera/camera.dart';

import 'bar.dart';

List<String> listOfUrls = List();
List<Widget> listOfPics = List();

var firstCamera;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  firstCamera = cameras.first;

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
            body: StreamBuilder(
                stream: Firestore.instance.collection('images').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  for (int i = 0; i < snapshot.data.documents.length; i++) {
                    listOfUrls.add(snapshot.data.documents[i]['url']);
                    listOfPics.add(Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 50),
                      child: Image.network(listOfUrls[i]),
                    ));
                  }
                  return Bar();
                })));
  }
}
