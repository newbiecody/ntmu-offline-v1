import 'package:flutter/material.dart';
import 'package:ntmu/Components/MatchedUsersList_static.dart';
import 'package:ntmu/Components/announcements_static.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/api_functions/announcementsApi.dart';

import '../../../Components/chats_static_data.dart';
import '../../../Models/UserInfo_secure.dart';
import '../../../api_functions/match.dart';
import '../../../common/GLOBAL_SETTINGS.dart';


class recommendationPage extends StatefulWidget{
  UserInfoFlexi_noPassword userData;
  recommendationPage({Key? key, required this.userData}) : super(key:key);

  @override
  State<recommendationPage> createState() => recommendationPageState();
}

class recommendationPageState extends State<recommendationPage>{
  final ScrollController _scrollController = ScrollController();
  void _scrollUp() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  //generate informations about matches

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
          controller: _scrollController,
          child: MatchedUsersData.list_matchedUsers.isEmpty ? Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  Text("You currently do not have any matches.",
                    style: TextStyle(
                      fontSize: 16),
                  ),
                      ElevatedButton(
                        onPressed: () async{
                          demandMatches(context);
                        },
                        child: Text("Start matching?"),
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                            minimumSize: Size(100,35)
                        )
                      )
                ]
              )) :
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child:FittedBox(
                        child: Image.network('${address_targetMachine_uri_media}${MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_avatarURL"]}'),
                       fit: BoxFit.contain,
                      ),
                  ),
                // ),
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
                      Text('${MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_name"]}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text('Year ${calculateYoM(MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_matricYear"])}, ${MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_courseOfStudyID"]}')
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
                      Text('${MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_desc"]}',
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
                      Text(MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_hobbies"] == '' ? '-' : '${MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_hobbies"]}',
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
                      Text('${MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_countryOfOriginID"]}',
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
                      Text(MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_religion "] == null ? '-' : '${MatchedUsersData.list_matchedUsers[0].data_userTwo["matched_with_religion "]}',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () async{
                                // Test functions here
                                setState(() {
                                  MatchedUsersData.list_matchedUsers.removeAt(0);
                                  _scrollUp();
                                });
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
                                MatchedUsersData.list_matchedUsers..removeAt(0);
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
