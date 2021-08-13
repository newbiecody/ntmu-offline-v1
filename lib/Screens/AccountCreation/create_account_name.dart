import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';


class create_account_name extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('What is your full name?',
                style: TextStyle(
                  fontSize: 20
                )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 62.5),
                    child: TextField(
                      maxLength: 50,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          counterText: ''
                      ),
                    )
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: (){
                      askBirthday(context);
                    },
                    child: Text(
                        'Next'
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                        minimumSize: Size(170,35)
                    )
                )
              ],

            )
        )
    );
  }

}