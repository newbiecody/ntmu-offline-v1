import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class create_account_confirmation extends StatelessWidget{

  dataPacket creationData;
  create_account_confirmation({Key? key, required this.creationData}) : super(key: key);

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
                  Text('Name: ${creationData.name}'),
                  Text('Email: ${creationData.email}'),
                  Text('Birthday: ${creationData.birthday}'),
                  Text('Bio: ${creationData.profile_desc}'),
                  Text('Course: ${creationData.course}'),
                  Text('Year of study: ${creationData.year}'),
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
