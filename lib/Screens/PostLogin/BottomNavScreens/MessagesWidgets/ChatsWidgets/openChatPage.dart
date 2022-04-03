import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ChatMessage.dart';
import 'package:ntmu/Models/ChatThread.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/ChatMessagesArea.dart';

import '../../../../../Components/chats_static_data.dart';
import '../../../../../api_functions/chatsApi.dart';

class openChatPage extends StatefulWidget{
  ChatThread ChatData;
  openChatPage({Key? key, required this.ChatData});
  @override
  State<openChatPage> createState() => openChatPageState();
}

class openChatPageState extends State<openChatPage> {

  final myController = TextEditingController();
  static bool _imageError = false;
  // List <ChatMessage> chatHistory = [
  //   ChatMessage(user_or_match: "user", message: 'Hello wth', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Hello?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'How\'s life?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Great i guess?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'nice', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Want to hang out tmr?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'yea sure', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'koufu at 12pm?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'err okay', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'seeya then', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'Hello wth', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Hello?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'How\'s life?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Great i guess?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'nice', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Want to hang out tmr?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'yea sure', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'koufu at 12pm?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'err okay', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'Hello wth', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Hello?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'How\'s life?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Great i guess?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'nice', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'Want to hang out tmr?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'yea sure', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "match", message: 'koufu at 12pm?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
  //   ChatMessage(user_or_match: "user", message: 'err okay', dateSent: DateTime.parse("2021-07-20 20:18:04"))
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder:
              (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(context),
            );
          }
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                        onBackgroundImageError: (_,__){
                          setState(() {
                            _imageError = true;
                          });
                        },
                        child: _imageError? Text(widget.ChatData.chatting_with_name[0]) : null,
                        backgroundImage:  AssetImage(widget.ChatData.chatting_with_avatarUrl)),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.ChatData.chatting_with_name,
                          style: TextStyle(
                            fontSize: 16
                          ),),
                        Text('Active ' + timeFromNow(widget.ChatData.last_message_time) + ' ...',
                          style: TextStyle(
                            fontSize: 12
                          ),)
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*.1)
            ]
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: SingleChildScrollView(
                      child: ChatMessagesArea(chatMessages: generateList_chatMessage(widget.ChatData.messages)))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      width: MediaQuery.of(context).size.width*.75,
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          hintText: 'Write message...'
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: FloatingActionButton(
                          child: Icon(Icons.send_rounded),
                          onPressed: (){
                            setState(() {
                              if(myController.text.trim() != null && myController.text.trim() != ''){
                                // Send chat function here
                                // ChatData_static.message_threads['messages'].add(ChatMessage(sender_id: 'sender', content: myController.text, dateSent: DateTime.now()));
                              }
                            });
                            myController.clear();
                        }
                      ),
                    )

                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

}