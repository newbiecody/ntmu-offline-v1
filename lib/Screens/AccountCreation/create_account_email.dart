import 'package:flutter/material.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_password.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ntmu/Models/UserInfo.dart';

class create_account_email extends StatelessWidget{

  UserInfo creationData = new UserInfo();

  isOfficialEmail(String? email){
    String officialEmailPattern = "ntu.edu.sg";
    if(email != null){
      return email.contains(new RegExp(officialEmailPattern, caseSensitive: false));
    }
  }

  // create_account_email({Key? key, required this.creationData}) : super(key: key);
  final emailInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Hello there! Please provide us with \n your NTU email address.',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 62.5),
                child: TextFormField(
                  controller: emailInputController,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) => isOfficialEmail(value!) ? null : 'Please enter an official NTU email address.',
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
                    if(EmailValidator.validate(emailInputController.text)) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              create_account_password(
                                  email: emailInputController.text)));
                    }else{
                      showDialog<String>(context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Error'),
                            content: Text('Please enter a valid NTU email address.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('Ok')
                              )
                            ],
                          )
                      );
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