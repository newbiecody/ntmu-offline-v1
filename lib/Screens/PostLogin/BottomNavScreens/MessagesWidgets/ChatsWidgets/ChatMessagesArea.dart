import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ChatMessage.dart';
import 'package:ntmu/Models/ChatUser.dart';

class ChatMessagesArea extends StatefulWidget{
  List <ChatMessage> chatMessages;
  ChatMessagesArea({Key? key, required this.chatMessages});
  @override
  State<ChatMessagesArea> createState() => ChatMessagesAreaState();
}

class ChatMessagesAreaState extends State<ChatMessagesArea> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
        itemCount: widget.chatMessages.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10,bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: widget.chatMessages[index].sender_or_receiver == "receiver" ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.chatMessages[index].sender_or_receiver == "receiver" ? Colors.black12 : Color(0XFF99DDC8)
                  ),
                  padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                  child: Text(widget.chatMessages[index].message),
                ),
              ),
            );
          },
        ),
      ]
    );
  }

}