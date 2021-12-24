import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';


class recommendationPage extends StatefulWidget{
  LoggedUserInfo userData;
  recommendationPage({Key? key, required this.userData}) : super(key:key);

  @override
  State<recommendationPage> createState() => recommendationPageState();
}

class recommendationPageState extends State<recommendationPage>{
  //generate informations about matches
  
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
          child:Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  //width: MediaQuery.of(context).size.width,
                  child:FittedBox(
                      child: Text('LOL'),
                      //Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0X3399DDC8)
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Insert match names here',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text('Year 3, School of Computer Science and Engineering')
                      ),
                      SizedBox(height:25),
                      Text('About myself',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0X80000000)
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Hello, my name is Jeslyn and I am looking for more friends to talk about everything in life, sing songs and go out for movies and enjoyable things! ',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 25),
                      Text('Interests',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0X80000000)
                        ),
                      ),
                      Text(hobbiesString(widget.userData.hobbies),
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 25),
                      Text('Country of Origin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0X80000000)
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Singapore',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 25),
                      Text('Religion',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0X80000000)
                        ),
                      ),
                      SizedBox(height:5),
                      Text('Christian',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: (){

                              },
                              child: Text(
                                  'Accept'
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                                  minimumSize: Size(100,35)
                              )
                          ),
                          SizedBox(width: 100),
                          ElevatedButton(
                              onPressed: (){

                              },
                              child: Text(
                                  'Reject'
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                                  minimumSize: Size(100,35)
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                )


                ],
              )
          )
      );
  }
}
