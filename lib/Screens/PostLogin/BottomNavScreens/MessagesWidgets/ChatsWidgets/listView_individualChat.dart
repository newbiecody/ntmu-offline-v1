import 'package:flutter/material.dart';
import 'package:ntmu/Models/chatUser.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/openChatPage.dart';

import 'dart:math';

class individualChatWidget extends StatefulWidget{
  chatUser individualChat;
  individualChatWidget({Key? key, required this.individualChat});
  @override
  State<individualChatWidget> createState() => individualChatWidgetState();
}

class individualChatWidgetState extends State<individualChatWidget> {

  static bool _imageError = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(openChatPage(individualChat: widget.individualChat))));
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
              child: _imageError? Text(widget.individualChat.name[0]) : null,
              backgroundImage: AssetImage(widget.individualChat.imageURL),
              backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.individualChat.name,
                style: TextStyle(
                  fontSize: 16
                ),),
                Text(widget.individualChat.messageText)
              ],
            ),
            Expanded(child: Container()),
            Text(
              timeFromNow(widget.individualChat.time),
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