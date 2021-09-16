import 'package:flutter/material.dart';
import 'package:ntmu/Screens/PostLogin/baseScreen_postLogin.dart';
import 'Screens/login_home.dart';
import 'Components/functs.dart';
import 'package:ntmu/Models/dataPacket.dart';

// @dart=2.9

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  dataPacket userData = new dataPacket();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/loginScreen': (BuildContext context) => new loginScreen(),
        //'/userRecommendationPage': (BuildContext context) => new baseScreen_postLogin(userData: userData),
      },
      title: 'Nice To meet You',
      theme: ThemeData(
        fontFamily: 'BalsamiqSans',
        backgroundColor: CreateMaterialColor(Color(0XFFF8F9FA)),
        primarySwatch: CreateMaterialColor(Color(0xFF50808E)),
      ),
      home: loginScreen(),

    );
  }
}

