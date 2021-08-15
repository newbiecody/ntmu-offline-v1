import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class create_account_confirmation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Please check that the information that you have entered is correct!',
                  style: TextStyle(
                    fontSize: 20
                    ),
                  ),
                  SizedBox(height: 25),
                  Text('Name: *Insert name info here*'),
                  Text('Email: *Insert email info here*'),
                  Text('Birthday: *Insert birthday date here*'),
                  Text('Bio: *Insert bio here*'),
                  Text('Course: *Insert course here*'),
                  Text('Year of study: *Insert year of study here*'),
                  Text('Hobbies: *Insert bios here*'),
                  ElevatedButton(
                      onPressed: (){
                        RegisterNewAccountInformation(context);
                      },
                      child: Text(
                          'Confirm'
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                          minimumSize: Size(170,35)
                      )
                  )

                ],

              ),
            )
        )
    );
  }

}
