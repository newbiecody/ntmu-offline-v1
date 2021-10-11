import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/announcementHeaderInfo.dart';


class announcements extends StatefulWidget{
  //dataPacket userData;
  //announcements({Key? key, required this.userData}) : super(key:key);
  bool isPanelOpenNow;
  announcements({Key? key, required this.isPanelOpenNow}) : super(key:key);

  @override
  State<announcements> createState() => announcementsState();
}

class announcementsState extends State<announcements>{
  List<announcementHeaderInfo> announcementsList = [
    announcementHeaderInfo(poster: 'Admin', messageText: 'Welcome to NTmU! I hope that you will enjoy your stay here', time: DateTime.parse("2021-07-20 20:18:04")),
    announcementHeaderInfo(poster: 'Admin', messageText: 'There are some patches that had been added to ', time: DateTime.parse("2021-09-16 20:18:04"))
  ];

  generateAnnouncements(List announcements){
    var announcementTiles = <Widget>[];
    announcements.forEach((element) {
      announcementTiles.add(
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: <Widget>[
                Align(child: Text(element.poster), alignment: Alignment.centerLeft),
                SizedBox(height: 10),
                Align(child: Text(element.messageText), alignment: Alignment.centerLeft),
                SizedBox(height: 10),
                Align(child: Text(element.time.toString()), alignment: Alignment.centerRight)
                ],
            ),
          )
      );
      announcementTiles.add(Divider(thickness: 1));
      }
    );
    return announcementTiles;
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: generateAnnouncements(announcementsList),
      )
    );
  }
}
