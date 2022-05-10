import 'package:flutter/material.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/announcements.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/chats.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/Notifications/notifications.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/yourposts.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../Models/UserInfo_secure.dart';

class messagesPage extends StatefulWidget{
  UserInfoFlexi_noPassword userData;
  messagesPage({Key? key, required this.userData}) : super(key:key);

  @override
  State<messagesPage> createState() => messagesPageState();
}

class messagesPageState extends State<messagesPage>{
  static int userClickOption = 1;
  //notif, announcement, chats, yourposts corresponds to index 0,1,2,3 of _selectedOption
  static List <bool> _selectedOption = [false,true,false,false];
  //PanelController _pc = new PanelController();
  static bool _isPanelOpenNow = false;
  generateSubscreenMessages(userClickOption,sc, bool isPanelOpenNow) {
    List <Widget> messagesSubScreens = [
      notifications(isPanelOpenNow: isPanelOpenNow, username: widget.userData.name!),
      announcements(isPanelOpenNow: isPanelOpenNow),
      chats(isPanelOpenNow: isPanelOpenNow),
      yourPosts(isPanelOpenNow: isPanelOpenNow, username: widget.userData.name!)
    ];
    return messagesSubScreens[userClickOption];
  }
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      onPanelOpened: (){
        setState(() {
          _isPanelOpenNow = true;
        });
      },
        onPanelClosed: (){
          setState(() {
            _isPanelOpenNow = false;
          });
      },
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: MediaQuery.of(context).size.height*.6,
      panelBuilder: (ScrollController sc) => _scrollingList(sc, _isPanelOpenNow),
      body: Center(
        child: Column(
            children: <Widget>[
            SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // OutlinedButton(
              //     onPressed: (){
              //       setState(() {
              //         _selectedOption = [false,false,false,false];
              //         userClickOption = 0;
              //         _selectedOption[userClickOption] = !_selectedOption[userClickOption];
              //       });
              //     },
              //     child: Text(
              //         'Notifications'
              //     ),
              //     style: OutlinedButton.styleFrom(
              //         backgroundColor: _selectedOption[0]? Color(0XFF99DDC8):Color(0X4099DDC8),
              //         shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
              //         minimumSize: Size(150,35)
              //     )
              // ),
              // SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              OutlinedButton(
                  onPressed: (){
                    setState(() {
                      _selectedOption = [false,false,false,false];
                      userClickOption = 1;
                      _selectedOption[userClickOption] = !_selectedOption[userClickOption];
                    });
                  },
                  child: Text(
                      'Announcements'
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: _selectedOption[1]? Color(0XFF99DDC8):Color(0X4099DDC8),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                      minimumSize: Size(150,35)
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                  onPressed: (){
                    setState(() {
                      _selectedOption = [false,false,false,false];
                      userClickOption = 2;
                      _selectedOption[userClickOption] = !_selectedOption[userClickOption];
                    });
                  },
                  child: Text(
                      'Chats'
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: _selectedOption[2]? Color(0XFF99DDC8):Color(0X4099DDC8),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                      minimumSize: Size(150,35)
                  )
              ),
              // SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              // OutlinedButton(
              //     onPressed: (){
              //       setState(() {
              //         _selectedOption = [false,false,false,false];
              //         userClickOption = 3;
              //         _selectedOption[userClickOption] = !_selectedOption[userClickOption];
              //       });
              //     },
              //     child: Text(
              //         'Your Posts'
              //     ),
              //     style: OutlinedButton.styleFrom(
              //         backgroundColor: _selectedOption[3]? Color(0XFF99DDC8):Color(0X4099DDC8),
              //         shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
              //         minimumSize: Size(150,35)
              //     )
              // ),
            ],
          ),
         ]
        ),
      )
    );
    }

    Widget _scrollingList(ScrollController sc, bool isPanelOpenNow){
      return generateSubscreenMessages(userClickOption, sc, isPanelOpenNow);
    }

  }

