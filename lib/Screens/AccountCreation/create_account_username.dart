import 'package:flutter/material.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_birthday.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_email.dart';

import 'create_account_name.dart';


class create_account_username extends StatelessWidget{

  UserInfo creationData = new UserInfo();
  final nameController = new TextEditingController();

  create_account_username({Key? key, required this.creationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Please set a username.',
                      style: TextStyle(
                          fontSize: 20
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 62.5),
                      child: TextFormField(
                        controller: nameController,
                        maxLength: 50,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) => value == null || value == ''? 'Please enter a username.' : null,
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
                        if(nameController.text == '' || nameController.text == null){
                          showDialog<String>(context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text('Please enter a username.'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('Ok')
                                  )
                                ],
                              )
                          );
                        }else{
                          //askBirthday(context);
                          creationData.username = nameController.text;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_name(creationData: creationData))));
                        }
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
      ),
    );
  }

}