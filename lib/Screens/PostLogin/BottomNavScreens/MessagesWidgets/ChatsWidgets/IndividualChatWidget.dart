import 'package:flutter/material.dart';
import 'package:ntmu/Models/ChatThread.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/openChatPage.dart';

import 'dart:math';

class IndividualChatWidget extends StatefulWidget{
  ChatThread ChatPreviewInfo;
  IndividualChatWidget({Key? key, required this.ChatPreviewInfo});
  @override
  State<IndividualChatWidget> createState() => IndividualChatWidgetState();
}

class IndividualChatWidgetState extends State<IndividualChatWidget> {

  static bool _imageError = false;
  List textMessages = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(openChatPage(ChatData: widget.ChatPreviewInfo))));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
         child: Row(
          children: <Widget>[
            CircleAvatar(
              onBackgroundImageError: (_,__){
                setState(() {
                  _imageError = true;
                });
              },
              child: _imageError ? Text(widget.ChatPreviewInfo.chatting_with_name[0]) : null,
              backgroundImage: NetworkImage(widget.ChatPreviewInfo.chatting_with_avatarUrl),
              backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.ChatPreviewInfo.chatting_with_name,
                style: TextStyle(
                  fontSize: 16
                ),),
                Text(widget.ChatPreviewInfo.messages.first['content'])
              ],
            ),
            Expanded(child: Container()),
            Text(
              timeFromNow(widget.ChatPreviewInfo.last_message_time),
              style: TextStyle(
                color: Color(0X80000000),
                fontSize: 12
              ),
            )
          ],
        ),
      ),
    );
  }
}