import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';

import '../../../Models/UserInfo_secure.dart';

class editProfilePage extends StatefulWidget{
  UserInfoFlexi_noPassword userData;
  editProfilePage({Key? key, required this.userData}) : super(key:key);

  @override
  State<editProfilePage> createState() => _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {

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
        title: Text('Edit Profile '),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: (){saveProfileEdits();},
              icon: Icon(Icons.check))
        ],
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
                      color: Color(0X8099DDC8)
                  ),
                  height: 40,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.userData.name!,
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                )
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8)
                  ),
                  height: 40,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Age',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.grey
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text((DateTime.now().year - widget.userData.birthday!.year).toString(),
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8)
                  ),
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Male',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8)
                  ),
                  height: 40,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Religion',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                  ),
                  decoration: InputDecoration.collapsed(hintText: ''),
                  controller: TextEditingController(text: 'Christianity'),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8)
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            child: Text('Interests',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              GestureDetector(
                onTap: (){

                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Badminton, Bowling, Cheerleading, Music, Scuba Diving, Singing, Watching movies, Whale watching',
                        style: TextStyle(
                            color: Color(0X80000000)
                        ),
                      ),
                    )
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8)
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [Expanded(
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
                        ],
                      ),
                    ),
                    ]
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  child: TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    //maxLength: 300,
                    maxLines: null,
                    decoration: InputDecoration.collapsed(hintText: ''),
                    controller: TextEditingController(text: widget.userData.profile_desc),
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      )
    );
  }
}

