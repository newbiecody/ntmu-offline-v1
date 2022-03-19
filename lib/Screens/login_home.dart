import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:ntmu/Models/UserModel.dart';
import 'package:ntmu/Screens/PostLogin/preLoginLoadingPage.dart';
import 'package:ntmu/api_functions/apiMessageDialog.dart';
import 'package:ntmu/api_functions/callLogin.dart';
import '../Components/functs.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_email.dart';
import 'package:ntmu/Models/UserInfo.dart';

import 'PostLogin/baseScreen_postLogin.dart';

class loginScreen extends StatelessWidget{

  UserInfo creationData = new UserInfo();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
                <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 120),
                  child: Text(
                    'Welcome to NTmU',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFF495057),
                      fontSize: 28,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[

                    Row(
                      children: [
                        SizedBox(width: 100),
                        Text(
                          'Username',
                          // 'Email',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0XFF495057),
                            fontSize: 12
                          )
                        ),
                      ],
                    ),
                    Container(
                      //margin: EdgeInsets.all(0),
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: TextField(
                        controller: usernameController,
                        maxLength: 25,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          counterText: ''
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 100),
                        Text(
                          'Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0XFF495057),
                            fontSize: 12
                          )
                        ),
                      ],
                    ),
                    Container(
                      //margin: EdgeInsets.all()
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        maxLength: 50,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          counterText: ''),
                      )
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: 'Forgot password?',
                        recognizer: new TapGestureRecognizer()..onTap = (){
                          //forgotPassword();
                        },
                        style: TextStyle(
                          fontSize: 12,
                        )
                      )
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: ()async{
                        await login(context, usernameController.text, passwordController.text);
                        // requestLoginToken(usernameController.text, passwordController.text);

                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BaseScreen_postLogin(userData: )), (route) => false);

                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BaseScreen_postLogin(userData: creationData)), (Route<dynamic> route) => false);
                      },
                      child: Text('Sign in'),
                      style:
                        ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                          minimumSize: Size(170,35)),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(90,10,0,10),
                            child: Divider(
                              color: Color(0XFF495057)
                            ),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,10,10,10),
                          child: Text('or'),
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,10,90,10),
                              child: Divider(
                                  color: Color(0XFF212529)
                              ),
                            )
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                      child: ElevatedButton(
                          onPressed: (){
                            //createAccount(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => create_account_email()));
                          },
                          child: Text('New here? Create an account'),
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35))

                          )
                      ),
                    )
                  ]
                ),
              ],

            ),
          )
        )
      ),
    );
  }
}