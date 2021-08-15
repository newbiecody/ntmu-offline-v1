import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class editProfilePage extends StatefulWidget{
  const editProfilePage({Key? key}) : super(key:key);

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
                  child: Expanded(
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
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('John Doe',
                    style: TextStyle(
                      color: Color(0X80000000)
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
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          child: Text('Age',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('26',
                      style: TextStyle(
                          color: Color(0X80000000)
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
                  child: Expanded(
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
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Male',
                      style: TextStyle(
                          color: Color(0X80000000)
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
                  child: Expanded(
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
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  style: TextStyle(
                      color: Color(0X80000000),
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
                  child: Expanded(
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
                  )
              ),
              Padding(
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
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8)
                  ),
                  child: Expanded(
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
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  child: TextField(
                    style: TextStyle(
                        color: Color(0X80000000),
                        fontSize: 14
                    ),
                    maxLength: 300,
                    maxLines: null,
                    decoration: InputDecoration.collapsed(hintText: ''),
                    controller: TextEditingController(text: 'Funny open minded and optimistic guy who is into sports and recently into Scuba diving. I’m a Capricorn:) ESFJ-S. I may not look like one but I’m Chinese mixed Korean who is born and bred in Singapore :)'),
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

