import 'package:flutter/material.dart';
import 'package:ntmu/Components/announcements_static.dart';
import 'package:intl/intl.dart';

class announcements extends StatefulWidget{
  //dataPacket userData;
  //announcements({Key? key, required this.userData}) : super(key:key);
  bool isPanelOpenNow;
  announcements({Key? key, required this.isPanelOpenNow}) : super(key:key);

  @override
  State<announcements> createState() => announcementsState();
}

class announcementsState extends State<announcements>{
  // List<AnnouncementHeaderInfo> announcementsList = [
  //   AnnouncementHeaderInfo(poster: 'Admin', messageText: 'Welcome to NTmU! I hope that you will enjoy your stay here', time: DateTime.parse("2021-07-20 20:18:04")),
  //   AnnouncementHeaderInfo(poster: 'Admin', messageText: 'There are some patches that had been added to ', time: DateTime.parse("2021-09-16 20:18:04"))
  // ];

  generateAnnouncements(List announcements){
    var announcementTiles = <Widget>[SizedBox(height: 20)];
    final DateFormat formatter = DateFormat('dd-MM-yyyy');

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
                Align(child: (element.time != null) ? Text(formatter.format(element.time)) : Text(''), alignment: Alignment.centerRight)
                ],
            ),
          )
      );
      announcementTiles.add(Divider(thickness: 1));
      }
    );
    announcementTiles.add(SizedBox(height: 150));
    return announcementTiles;
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      physics: widget.isPanelOpenNow ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      child: Column(
        children: generateAnnouncements(Announcements_static.announcements_list),
      )
    );
  }
}
