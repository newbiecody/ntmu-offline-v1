import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';


class baseScreen_postLogin extends StatefulWidget{
  const baseScreen_postLogin({Key? key}) : super(key:key);

  @override
  State<baseScreen_postLogin> createState() => _baseScreen_postLoginState();
}

class _baseScreen_postLoginState extends State<baseScreen_postLogin>{
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = [
    Text('page1'),
    Text('Page2'),
    Text('Page3')
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                      maxRadius: 37.5,
                      backgroundColor: Color(0X3399DDC8),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('John Doe',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Insert email here',
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
                        drawerProfile(context);
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
                            settingsProfile(context);
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
              )
            ],
          ),
        ),
        body: _widgetOptions[_selectedIndex],
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
    );

  }
}
