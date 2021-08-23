import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class create_account_confirmation extends StatelessWidget{

  dataPacket creationData;
  create_account_confirmation({Key? key, required this.creationData}) : super(key: key);

  String hobbiesString(List<String> hobbiesList){
    String hobbies = '';
    hobbiesList.forEach((element) {
      hobbies += element;
      hobbies += ', ';
    });
    hobbies = hobbies.substring(0, hobbies.length-2);

    return hobbies;
  }


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
                  Text('Name: ${creationData.name}',
                  style: TextStyle(
                    fontSize: 16
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('Email: ${creationData.email}',
                  style: TextStyle(
                    fontSize: 16
                    ),
                  ),
                  Text('Birthday: ${creationData.birthday}'),
                  Text('Bio: ${creationData.profile_desc}'),
                  Text('Course: ${creationData.course}'),
                  Text('Year of study: ${creationData.year}'),
                  Text('Hobbies: ${hobbiesString(creationData.hobbies)}'),
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
                      ),
                  )

                ],

              ),
            )
        )
    );
  }

}
