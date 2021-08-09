import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical:190),
              child: Text(
                'Welcome to NTmU',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF495057),
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Username',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0XFF495057),
                    fontSize: 12
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: TextField(

                  ),
                ),
                Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0XFF495057),
                    fontSize: 12
                  )
                ),
                Container(
                  child: TextField(

                  )
                )


              ]
            ),
          ],

        )
      )
    );
  }
}