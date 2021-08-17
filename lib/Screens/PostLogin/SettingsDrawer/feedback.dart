import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';

class feedbackPage extends StatefulWidget{
  const feedbackPage({Key? key}) : super(key:key);

  @override
  State<feedbackPage> createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {

  int _qnOneAnswer = -1;
  int _qnTwoAnswer = -1;
  int _qnThreeAnswer = -1;
  int _qnFourAnswer = -1;

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
        title: Text('Feedback'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,0,20),
                  child: Text('Will you continue to use the system after its official release?',
                  style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,0,0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio<int>(
                            value: 1,
                            onChanged: (value){
                              setState((){
                                _qnOneAnswer = value!;
                              });
                            },
                            groupValue: _qnOneAnswer,
                          ),
                          SizedBox(width: 10,),
                          Text('Strongly Agree')
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio<int>(
                            value: 2,
                            onChanged: (value){
                              setState(() {
                                _qnOneAnswer = value!;
                              });
                            }, groupValue: _qnOneAnswer,
                          ),
                          SizedBox(width: 10),
                          Text('Agree')
                        ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 3,
                              onChanged: (value){
                                setState(() {
                                  _qnOneAnswer = value!;
                                });
                              }, groupValue: _qnOneAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Neutral')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 4,
                              onChanged: (value){
                                setState(() {
                                  _qnOneAnswer = value!;
                                });
                              }, groupValue: _qnOneAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Disagree')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 5,
                              onChanged: (value){
                                setState(() {
                                  _qnOneAnswer = value!;
                                });
                              }, groupValue: _qnOneAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Strongly Disagree')
                          ]
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color(0X80000000)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,0,0),
                  child: Text('Do you think that this is an useful system to make new friends?',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,0,0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio<int>(
                            value: 1,
                            onChanged: (value){
                              setState((){
                                _qnTwoAnswer = value!;
                              });
                            },
                            groupValue: _qnTwoAnswer,
                          ),
                          SizedBox(width: 10,),
                          Text('Strongly Agree')
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 2,
                              onChanged: (value){
                                setState(() {
                                  _qnTwoAnswer = value!;
                                });
                              }, groupValue: _qnTwoAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Agree')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 3,
                              onChanged: (value){
                                setState(() {
                                  _qnTwoAnswer = value!;
                                });
                              }, groupValue: _qnTwoAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Neutral')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 4,
                              onChanged: (value){
                                setState(() {
                                  _qnTwoAnswer = value!;
                                });
                              }, groupValue: _qnTwoAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Disagree')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 5,
                              onChanged: (value){
                                setState(() {
                                  _qnTwoAnswer = value!;
                                });
                              }, groupValue: _qnTwoAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Strongly Disagree')
                          ]
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color(0X80000000)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,0,0),
                  child: Text('Do you think that privacy issue is a concern?',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,0,0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio<int>(
                            value: 1,
                            onChanged: (value){
                              setState((){
                                _qnThreeAnswer = value!;
                              });
                            },
                            groupValue: _qnThreeAnswer,
                          ),
                          SizedBox(width: 10,),
                          Text('Strongly Agree')
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 2,
                              onChanged: (value){
                                setState(() {
                                  _qnThreeAnswer = value!;
                                });
                              }, groupValue: _qnThreeAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Agree')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 3,
                              onChanged: (value){
                                setState(() {
                                  _qnThreeAnswer = value!;
                                });
                              }, groupValue: _qnThreeAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Neutral')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 4,
                              onChanged: (value){
                                setState(() {
                                  _qnThreeAnswer = value!;
                                });
                              }, groupValue: _qnThreeAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Disagree')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 5,
                              onChanged: (value){
                                setState(() {
                                  _qnThreeAnswer = value!;
                                });
                              }, groupValue: _qnThreeAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Strongly Disagree')
                          ]
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Color(0X80000000)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,0,0),
                  child: Text('Do you feel that the frequency of getting new recommendations is too low?',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,0,0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio<int>(
                            value: 1,
                            onChanged: (value){
                              setState((){
                                _qnFourAnswer = value!;
                              });
                            },
                            groupValue: _qnFourAnswer,
                          ),
                          SizedBox(width: 10,),
                          Text('Strongly Agree')
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 2,
                              onChanged: (value){
                                setState(() {
                                  _qnFourAnswer = value!;
                                });
                              }, groupValue: _qnFourAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Agree')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 3,
                              onChanged: (value){
                                setState(() {
                                  _qnFourAnswer = value!;
                                });
                              }, groupValue: _qnFourAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Neutral')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 4,
                              onChanged: (value){
                                setState(() {
                                  _qnFourAnswer = value!;
                                });
                              }, groupValue: _qnFourAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Disagree')
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            Radio<int>(
                              value: 5,
                              onChanged: (value){
                                setState(() {
                                  _qnFourAnswer = value!;
                                });
                              }, groupValue: _qnFourAnswer,
                            ),
                            SizedBox(width: 10),
                            Text('Strongly Disagree')
                          ]
                      ),

                    ],
                  ),
                ),
              ),
              Divider(color: Color(0X80000000)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,0,0),
                  child: Text('What do you like most about NTmU?',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  maxLines: null,
                  decoration: InputDecoration.collapsed(hintText: 'Enter your feedback here...'),
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Color(0X80000000)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,0,0),
                  child: Text('Suggestions for improvements',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  maxLines: null,
                  decoration: InputDecoration.collapsed(hintText: 'Enter your feedback here...'),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){
                  //code here
                }
                ,
                child: Text('Submit feedback'),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                    minimumSize: Size(170,35)
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