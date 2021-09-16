import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';


class announcements extends StatefulWidget{
  //dataPacket userData;
  //announcements({Key? key, required this.userData}) : super(key:key);
  bool isPanelOpenNow;
  announcements({Key? key, required this.isPanelOpenNow}) : super(key:key);

  @override
  State<announcements> createState() => announcementsState();
}

class announcementsState extends State<announcements>{



  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Announcements page'),
    );
  }
}
