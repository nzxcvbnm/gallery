import 'package:flutter/material.dart';

import 'main.dart';

class Preview extends StatefulWidget {
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Container(
          color: Colors.black38,
          child: ListWheelScrollView(
            itemExtent: 500,
            diameterRatio: 10,
            children: listOfPics,
            //Image.network(snapshot.data.documents[i]['url']),
          ),
        ));
  }
}
