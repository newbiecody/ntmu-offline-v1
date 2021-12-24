import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ChatMessage.dart';
import 'package:ntmu/Models/ChatUser.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/ChatMessagesArea.dart';

class openChatPage extends StatefulWidget{
  ChatUser individualChat;
  openChatPage({Key? key, required this.individualChat});
  @override
  State<openChatPage> createState() => openChatPageState();
}

class openChatPageState extends State<openChatPage> {

  final myController = TextEditingController();
  List <ChatMessage> chatHistory = [
    ChatMessage(sender_or_receiver: "sender", message: 'Hello wth', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Hello?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'How\'s life?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Great i guess?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'nice', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Want to hang out tmr?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'yea sure', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'koufu at 12pm?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'err okay', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'seeya then', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'Hello wth', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Hello?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'How\'s life?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Great i guess?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'nice', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Want to hang out tmr?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'yea sure', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'koufu at 12pm?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'err okay', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'Hello wth', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Hello?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'How\'s life?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Great i guess?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'nice', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'Want to hang out tmr?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'yea sure', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "receiver", message: 'koufu at 12pm?', dateSent: DateTime.parse("2021-07-20 20:18:04")),
    ChatMessage(sender_or_receiver: "sender", message: 'err okay', dateSent: DateTime.parse("2021-07-20 20:18:04"))
  ];

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
                    CircleAvatar(backgroundImage: AssetImage(widget.individualChat.imageURL)),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.individualChat.name,
                          style: TextStyle(
                            fontSize: 16
                          ),),
                        Text('Active ' + timeFromNow(widget.individualChat.time) + ' ...',
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
                      child: ChatMessagesArea(ChatMessages: chatHistory))),
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
                                chatHistory.add(ChatMessage(sender_or_receiver: 'sender', message: myController.text, dateSent: DateTime.now()));
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