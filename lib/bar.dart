import 'package:flutter/material.dart';

import 'preview.dart';
import 'uploadfrompicker.dart';
import 'main.dart';
import 'camera/cam.dart';

class Bar extends StatefulWidget {
  @override
  BarState createState() => BarState();
}

class BarState extends State<Bar> {
  int tabIndex = 0;
  List<Widget> pages = [
    Preview(),
    Cam(camera: firstCamera),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SafeArea(
              child: BottomNavigationBar(
                iconSize: 25,
                elevation: 4.0,
                items: <BottomNavigationBarItem>[
                  barItem(Icons.apps),
                  barItem(Icons.camera_enhance),
                ],
                currentIndex: tabIndex,
                onTap: (int index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
              ),
            )),
        body: Container(
          child: pages.elementAt(tabIndex),
        ),
      ),
    );
  }
}

barItem(IconData iconpic) => BottomNavigationBarItem(
    icon: Icon(iconpic, color: Colors.grey),
    activeIcon: Icon(
      iconpic,
      color: Colors.black,
    ),
    title: Text(''));
