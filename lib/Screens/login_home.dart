import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../Components/functs.dart';

class loginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(

        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 190, 0, 120),
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
                      forgotPassword();
                    },
                    style: TextStyle(
                      fontSize: 12,
                    )
                  )
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: (){
                    authenticateUser();
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
                        padding: const EdgeInsets.fromLTRB(90,30,0,10),
                        child: Divider(
                          color: Color(0XFF495057)
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,30,10,10),
                      child: Text('or'),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0,30,90,10),
                          child: Divider(
                              color: Color(0XFF212529)
                          ),
                        )
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      onPressed: (){
                        createAccount();
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

        )
      )
    );
  }
}