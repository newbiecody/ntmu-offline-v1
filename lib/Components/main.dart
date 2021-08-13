import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Screens/login_home.dart';
import 'functs.dart';


void main() {
  String data = 'error';
  print(data);
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
        backgroundColor: CreateMaterialColor(Color(0XFFF8F9FA)),
        primarySwatch: CreateMaterialColor(Color(0xFF50808E)),
      ),
      home: loginScreen(),

    );
  }
}

