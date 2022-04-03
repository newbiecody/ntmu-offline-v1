import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ChatThread.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/IndividualChatWidget.dart';

import '../../../../Components/chats_static_data.dart';

class chats extends StatefulWidget{
  bool isPanelOpenNow;
  chats({Key? key, required this.isPanelOpenNow}) : super(key:key);
  @override
  State<chats> createState() => chatsState();
}

class chatsState extends State<chats>{

  TextEditingController searchBarController = new TextEditingController();

  generateChats(){
    var chatList = <Widget>[];

    chatList.add(SizedBox(height: 25));
    // Thread_id is id of thread, thread_info contains chatting_with_id, chatting_with_username, messages(list)
    ChatData_static.message_threads.forEach((thread_id, thread_info) {
      final DateTime datetime_lastMessage = DateTime.parse(thread_info['messages'][0]['sent_at'].replaceFirst('T', ' '));

      chatList.add(IndividualChatWidget(ChatPreviewInfo: ChatThread(chatting_with_id: thread_info['chatting_with_id'], chatting_with_name: thread_info['chatting_with_username'], chatting_with_avatarUrl: thread_info['chatting_with_avatarUrl'], messages: thread_info['messages'], last_message_time: datetime_lastMessage))
      );
    });
    chatList.add(SizedBox(height: 200));
    return chatList;
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      physics: widget.isPanelOpenNow ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
        child:Column(
          children: ChatData_static.message_threads.length!=0 ? generateChats() : <Widget> [
            SizedBox(height: 150),
            Text('No messages yet...',
              style: TextStyle(
                fontSize: 20
              ),
            )
          ]
        )
    );
  }
}



