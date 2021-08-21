import 'package:flutter/material.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_birthday.dart';
import 'package:ntmu/Components/functs.dart';


class create_account_name extends StatelessWidget{

  dataPacket creationData = new dataPacket();
  final nameController = new TextEditingController();

  create_account_name({Key? key, required this.creationData}) : super(key: key);

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
                    child: TextFormField(
                      controller: nameController,
                      maxLength: 50,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) => value == null || value == ''? 'Please enter your full name.' : null,
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
                              content: Text('Please enter your full name.'),
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
                        creationData.name = nameController.text;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_birthday(creationData: creationData,))));
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
    );
  }

}