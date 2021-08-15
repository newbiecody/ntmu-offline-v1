import 'package:flutter/material.dart';
import 'package:ntmu/Screens/PostLogin/baseScreen_postLogin.dart';
import '../Screens/login_home.dart';
import 'functs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/loginScreen': (BuildContext context) => new loginScreen(),
        '/userRecommendationPage': (BuildContext context) => new baseScreen_postLogin(),
      },
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

