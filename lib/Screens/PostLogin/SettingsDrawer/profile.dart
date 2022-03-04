import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';

import '../../../Models/UserInfo_secure.dart';
import 'editProfile.dart';

class profilePage extends StatefulWidget{
  UserInfoFlexi_noPassword userData;
  profilePage({Key? key, required this.userData}) : super(key:key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder:
            (BuildContext context){
              return IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => Navigator.pop(context),
              );
              }
          ),
        title: Text('Your Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                radius: 150,
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0X8099DDC8),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 32,
                child: Flex(
                  direction: Axis.horizontal,
                  children:<Widget> [Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          child: Text('Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          child: Text(widget.userData.name!,
                            style: TextStyle(
                              color: Color(0X80000000)
                              )
                            ),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                  ),
                  ]
                  )
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 32,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  child: Text('Age',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Align(
                                  child: Text((DateTime.now().year - widget.userData.birthday!.year).toString(),
                                      style: TextStyle(
                                          color: Color(0X80000000)
                                      )
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                          )
                    ]
                  )
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 32,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Gender',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            child: Text(widget.userData.gender!,
                                style: TextStyle(
                                    color: Color(0X80000000)
                                )
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    )
                  ],
                  )
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 32,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [
                      Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Religion',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            child: Text(widget.userData.religion!,
                                style: TextStyle(
                                    color: Color(0X80000000)
                                )
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Interests',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(height: 5),
                          Align(
                            child: Text(widget.userData.hobbies!.join(', '),
                                style: TextStyle(
                                    color: Color(0X80000000),
                                    fontStyle: FontStyle.italic
                                )
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Self-summary',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(height: 5),
                          Align(
                            child: Text(widget.userData.profile_desc!,
                                style: TextStyle(
                                    color: Color(0X80000000),
                                    fontStyle: FontStyle.italic
                                        )
                                    ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                      )
                    ]
                  )
                ),
              SizedBox(height:20)
            ]
          ),
        )

        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(editProfilePage(userData: widget.userData))));
            },
            child: Icon(Icons.edit)
      )
    );

  }
}

