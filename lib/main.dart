import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bar.dart';

List<String> listOfUrls = List();
List<Widget> listOfPics = List();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: Scaffold(
    body: StreamBuilder(
        stream: Firestore.instance.collection('images').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          for (int i = 0; i < snapshot.data.documents.length; i++) {
            listOfUrls.add(snapshot.data.documents[i]['url']);
            listOfPics.add(Card(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(listOfUrls[i])));
          }
          return Bar();
        }),
  )));
}
