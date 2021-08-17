import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class preferencePage extends StatefulWidget{
  const preferencePage({Key? key}) : super(key:key);

  @override
  State<preferencePage> createState() => _preferencePageState();
}

class _preferencePageState extends State<preferencePage> {

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
        title: Text('Preferences'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget> [
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
                              child: Text('Gender',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text('None',
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
                    children: <Widget> [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              child: Text('Country of Origin',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text('Singapore',
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
                    children: <Widget> [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              child: Text('Course of Study',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text('None',
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
                              child: Text('None',
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
                child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget> [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Align(
                              child: Text('Interests',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Align(
                              child: Text('None',
                                  style: TextStyle(
                                      color: Color(0X80000000)
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
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              editPreferences(context);
            },
            child: Icon(Icons.edit)
        )
    );
  }
}