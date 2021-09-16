import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';


class notifications extends StatefulWidget{
  //dataPacket userData;
  //notifications({Key? key, required this.userData}) : super(key:key);
  bool isPanelOpenNow;
  notifications({Key? key, required this.isPanelOpenNow}) : super(key:key);
  @override
  State<notifications> createState() => notificationsState();
}

class notificationsState extends State<notifications>{


  generateMatchRequests(List<Object> users){

  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      physics: widget.isPanelOpenNow ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget> [
          SizedBox(height: 50),
          Text('2 people wants to know you better! Get to know them better?'),
          SizedBox(height: 10),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(),
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'Amarla, Year 3 at School of Computer Science and Engineering'
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                      iconSize: 35,
                      onPressed: () {print('seeprofile');},
                      icon: Icon(Icons.pageview_outlined)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(),
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                        'Amarla, Year 3 at School of Computer Science and Engineering'
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                        iconSize: 35,
                        onPressed: () {print('seeprofile');},
                        icon: Icon(Icons.pageview_outlined)),
                  )
                ],
              ),
              SizedBox(height:10)
            ],
          ),
          Divider(thickness: 1),
          Column(
            children: <Widget>[
              Text('Someone liked your post 7 hours ago...'),
              SizedBox(height: 999)
            ],
          )

      ]

      ),
    );
  }
}
