import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/UserInfo_secure.dart';
import 'package:ntmu/RestartWidget.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/ForumWidgets/newPost.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/matches.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/messages.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/ForumWidgets/forum.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/Screens/loadingScreen.dart';
import 'package:ntmu/api_functions/callLogin.dart';

import 'SettingsDrawer/profile.dart';
import 'SettingsDrawer/settings.dart';

class BaseScreen_postLogin extends StatefulWidget{
  UserInfoFlexi_noPassword userData;
  Image dp;
  BaseScreen_postLogin({Key? key, required this.userData, required this.dp}) : super(key:key);

  @override
  State<BaseScreen_postLogin> createState() => BaseScreen_postLoginState();
}

class BaseScreen_postLoginState extends State<BaseScreen_postLogin>{

  Widget _body = LoadingScreen();
  static int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  generateMainPage(UserInfoFlexi_noPassword userData){
    List<Widget> _widgetOptions = [
      recommendationPage(userData: userData),
      forumPage(userData: userData),
      messagesPage(userData: userData)
    ];
    return _widgetOptions;

  }


  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      floatingActionButton: Visibility(
        visible: _selectedIndex == 1 ? true : false,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(NewPost(userData: widget.userData))));
          },
          child: const Icon(
            Icons.post_add_rounded
          )
        ),
      ),
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {Scaffold.of(context).openDrawer();}
                );
              },
            ),
            title: const Text('Nice to meet you'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Color(0xFF50808E),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      child: widget.dp,
                      // backgroundImage: widget.dp,
                      maxRadius: 37.5,
                      backgroundColor: Color(0X3399DDC8),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(widget.userData.name!,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(widget.userData.email!,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 45,
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(profilePage(userData: widget.userData))));
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Icon(Icons.account_circle_outlined),
                          flex: 1),
                          Expanded(child: Text('Profile',
                          style: TextStyle(fontSize: 16)),
                          flex: 3),
                        ],
                      )
                      ),
                      ),
                      Container(
                        height: 45,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(settingsPage(userData: widget.userData))));
                          },
                        child: Row(
                        children: <Widget>[
                          Expanded(child: Icon(Icons.settings_outlined),
                          flex: 1),
                          Expanded
                          (child: Text('Settings',
                                style: TextStyle(fontSize: 16)),
                            flex: 3),
                      ],
                    )
                ),
              ),
              Container(
                height: 45,
                child: GestureDetector(
                  onTap: (){
                    preferencesProfile(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Icon(Icons.favorite_outline_rounded),
                      flex: 1),
                      Expanded(child: Text('Preferences',
                          style: TextStyle(fontSize: 16)),
                      flex: 3),
                    ],
                  )
                ),
              ),
              Container(
                height: 45,
                child: GestureDetector(
                  onTap: (){
                    feedbackProfile(context);
                  },
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Icon(Icons.feedback_outlined),
                        flex: 1),
                        Expanded(child: Text('Feedback',
                            style: TextStyle(fontSize: 16)),
                        flex: 3),
                      ],
                    )
                ),
              ),
              Container(
                height: 45,
                child: GestureDetector(
                    onTap: (){
                      //head to Login page
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Log out'),
                            content: const Text('Are you sure you want to log out?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: (){
                                  // Remember to add function to remove token.
                                  RestartWidget.restartApp(context);
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'No'),
                                child: const Text('No'),
                              ),
                            ],
                          ));
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Icon(Icons.logout),
                            flex: 1),
                        Expanded(child: Text('Log out',
                            style: TextStyle(fontSize: 16)),
                            flex: 3),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
        body: generateMainPage(widget.userData)[_selectedIndex],
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Color(0XFF50808E),
          selectedItemColor: Color(0XFFFFFFFF),
          currentIndex:_selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Transform.rotate(
                    angle: 135,
                    child: Icon(Icons.brush_outlined)),
                label: 'Matches'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.forum_outlined),
                label: 'Forum'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined),
                label: 'Messages'
            ),
          ],
        )
    )
    );

  }
}
