import 'package:flutter/material.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'create_account_username.dart';

class create_account_password extends StatelessWidget{

  UserInfo creationData = new UserInfo();
  String email;
  final passwordController_one = TextEditingController();
  final passwordController_two = TextEditingController();
  bool _obsecurePassword_one = true;
  bool _obsecurePassword_two = true;
  create_account_password({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Set a password!',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 62.5),
                      child: TextFormField(
                        maxLength: 50,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            counterText: ''
                        ),
                        obscureText: _obsecurePassword_one,
                        controller: passwordController_one,
                      ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Re-type your password to confirm.',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 62.5),
                      child: TextFormField(
                        obscureText: _obsecurePassword_two,
                        autovalidateMode: AutovalidateMode.always,
                        controller: passwordController_two,
                        validator: (value) {
                          if (value.toString() != passwordController_one.text){
                            return 'The passwords do not match. Please try again';
                          }else{
                            return null;
                          }
                        },
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
                      if(passwordController_one.text == '' || passwordController_two.text == ''){
                          showDialog<String>(context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text('Please choose a password and confirm your password again please.' ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('Ok')
                                  )
                                ],
                              )
                          );
                        }else if(passwordController_one.text != passwordController_two.text){
                        showDialog<String>(context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Error'),
                              content: Text('Your passwords don\'t match, please try again.' ),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('Ok')
                                )
                              ],
                            )
                        );
                      }else{
                          creationData.email = email;
                          creationData.password = passwordController_one.text;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_username(creationData: creationData))));
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


