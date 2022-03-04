import 'package:flutter/material.dart';

import '../loadingScreen.dart';

class PreLoginLoadingScreen extends StatefulWidget{
  String username;
  String password;
  PreLoginLoadingScreen({Key? key, required this.username, required this.password});
  @override
  State<PreLoginLoadingScreen> createState() => PreLoginLoadingScreenState();
}

class PreLoginLoadingScreenState extends State<PreLoginLoadingScreen>{

  Widget _body = LoadingScreen();

  @override
  void initState(){
    _gotoHomeScreen();
  }

  _gotoHomeScreen() {
    // requestLoginToken(context, usernameController.text, passwordController.text);

  }


  @override
  Widget build(BuildContext context) {
    return _body;
  }


}



