import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class editPreferencePage extends StatefulWidget{
  const editPreferencePage({Key? key}) : super(key:key);

  @override
  State<editPreferencePage> createState() => _editPreferencePageState();
}

class _editPreferencePageState extends State<editPreferencePage> {
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
          title: Text('Edit preferences '),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: (){saveProfileEdits();},
                icon: Icon(Icons.check))
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8)
                  ),
                  height: 40,
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget> [Align(
                        child: Text('Gender',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('None',
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
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget> [Expanded(
                        child: Align(
                          child: Text('Country of Origin',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Singapore',
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
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget> [Expanded(
                        child: Align(
                          child: Text('Course of Study',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('None',
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
                  child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget> [Expanded(
                        child: Align(
                          child: Text('Religion',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      ]
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
                  controller: TextEditingController(text: 'None'),
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
              SizedBox(height: 20)
            ],
          ),
        )
    );
  }
}

