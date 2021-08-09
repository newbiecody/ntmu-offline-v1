import 'package:flutter/material.dart';
import 'login_home.dart';
import 'functs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nice To meet You',
      theme: ThemeData(
        fontFamily: 'Balsamiq Sans',
        backgroundColor: createMaterialColor(Color(0XFFF8F9FA)),
        primarySwatch: createMaterialColor(Color(0xFF50808E)),
      ),
      home: loginScreen(),
    );
  }
}

