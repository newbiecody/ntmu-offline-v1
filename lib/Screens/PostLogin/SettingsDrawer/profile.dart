import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class profilePage extends StatefulWidget{
  const profilePage({Key? key}) : super(key:key);

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
                child: Expanded(
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
                        child: Text('John Doe',
                          style: TextStyle(
                            color: Color(0X80000000)
                            )
                          ),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
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
                  child: Expanded(
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
                          child: Text('26',
                              style: TextStyle(
                                  color: Color(0X80000000)
                              )
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
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
                  child: Expanded(
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
                          child: Text('Male',
                              style: TextStyle(
                                  color: Color(0X80000000)
                              )
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
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
                  child: Expanded(
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
                          child: Text('Christianity',
                              style: TextStyle(
                                  color: Color(0X80000000)
                              )
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
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
                  child: Expanded(
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
                          child: Text('Badminton, Bowling, Cheerleading, Music, Scuba Diving, Singing, Watching movies, Whale watching',
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
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Color(0X8099DDC8),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
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
                        SizedBox(height: 5),
                        Align(
                          child: Text('Funny open minded and optimistic guy who is into sports and recently into Scuba diving. I’m a Capricorn:) ESFJ-S. I may not look like one but I’m Chinese mixed Korean who is born and bred in Singapore :)',
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
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          editProfile(context);
        },
        child: Icon(Icons.edit)
      ),
    );
  }
}

