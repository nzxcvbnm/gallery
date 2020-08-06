import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'bar.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: Bar(),
  )));
}
