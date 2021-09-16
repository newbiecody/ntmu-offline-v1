import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_hobbies.dart';
import 'package:ntmu/Models/dataPacket.dart';

class create_account_profileDesc extends StatelessWidget{

  final description = new TextEditingController();
  dataPacket creationData;
  create_account_profileDesc({Key? key, required this.creationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:80),
                    GestureDetector(
                      onTap: ()=> {
                        //uploadphoto
                      },
                      child: CircleAvatar(
                        radius: 150,
                        backgroundColor: Color(0X3399DDC8),
                        child: Icon(
                          Icons.add_a_photo_rounded,
                          color: Color(0XFF99DDC8),
                          size: 35
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text('Add a description about yourself!',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          Container(
                            height: 300,
                            child: TextFormField(
                              controller: description,
                              autovalidateMode: AutovalidateMode.always,
                              validator: (value){
                                if(value == null || value == ''){
                                  return 'Please enter a short description about yourself.';
                                }else{
                                  return null;
                                }
                              }
                              ,
                              maxLines: 15,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                filled: true,
                                fillColor: Color(0X3399DDC8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          if(description.text == null || description.text == ''){
                            showDialog<String>(context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: Text('Please provide us with a little bit of description about yourself.'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('Ok')
                                    )
                                  ],
                                )
                            );
                          }else{
                            creationData.profile_desc = description.text.trim();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_hobbies(creationData: creationData))));
                          }
                          //addHobbies(context);
                        },
                        child: Text(
                            'Next'
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                            minimumSize: Size(170,35)
                        )
                    ),
                    SizedBox(height:25)
                  ]
                ),
              )
          )
      ),
    );
  }

}