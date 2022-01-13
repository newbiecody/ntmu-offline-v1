import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Screens/PostLogin/baseScreen_postLogin.dart';
import 'package:ntmu/Models/UserInfo.dart';

class create_account_confirmation extends StatelessWidget{

  UserInfo creationData;
  create_account_confirmation({Key? key, required this.creationData}) : super(key: key);

  final DateFormat formatter = DateFormat('d MMMM y');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Please check that the information that you have entered is correct!',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0X8099DDC8),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                              ),
                            ),
                            Text('${creationData.name}'.trim())
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0X8099DDC8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                              ),
                            ),
                            Text('${creationData.email}'.trim())
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0X8099DDC8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Birthday',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text('${formatter.format(creationData.birthday)}')
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0X8099DDC8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Course',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            Text('${creationData.course}')
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0X8099DDC8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Year of study',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text('${creationData.year}')
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0X8099DDC8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flex(
                                direction: Axis.horizontal,
                                children: <Widget> [
                                  Text('Profile Description',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ]
                            ),
                            SizedBox(height: 5),
                            Text('${creationData.profile_desc}')
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0X8099DDC8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flex(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Text('Hobbies',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                )
                              ]
                            ),
                            SizedBox(height: 5),
                            Text('${hobbiesString(creationData.hobbies)}'.trim())
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BaseScreen_postLogin(userData: creationData)), (Route<dynamic> route) => false);
                              },
                              child: Text(
                                  'Confirm'
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                                  minimumSize: Size(170,35)
                              ),
                          ),
                          /*ElevatedButton(
                            onPressed: (){
                              //Navigator.pop(context, creationData);
                            },
                            child: Text(
                                'Back'
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                                minimumSize: Size(170,35)
                            ),
                          ),*/
                        ],
                      )

                    ],

                  ),
                ),
              )
          )
      ),
    );
  }

}
