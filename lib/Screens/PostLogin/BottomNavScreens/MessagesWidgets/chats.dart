import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ChatUser.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/listView_individualChat.dart';

class chats extends StatefulWidget{
  //dataPacket userData;
  //ScrollController sc;
  //chats({Key? key, required this.userData}) : super(key:key);

  bool isPanelOpenNow;
  chats({Key? key, required this.isPanelOpenNow}) : super(key:key);
  @override
  State<chats> createState() => chatsState();
}

class chatsState extends State<chats>{
   static List<ChatUser> chatUsers = [
    ChatUser(name: 'Amarla', time: DateTime.parse("2021-07-20 20:18:04"), imageURL: 'images/forFlutterDP1.jpg', messageText: ['Hello1']),
    ChatUser(name: 'John', time: DateTime.parse("2021-05-20 20:18:04"), imageURL: 'images/forFlutterDP2.jpg', messageText: ['Hello2']),
    ChatUser(name: 'Raini', time: DateTime.parse("2021-06-20 20:18:04"), imageURL: 'images/forFlutterDP3.jpg', messageText: ['Hello3']),
    ChatUser(name: 'Jerome', time: DateTime.parse("2021-07-18 20:18:04"), imageURL: 'images/forFlutterDP4.jpg', messageText: ['Hello4']),
    ChatUser(name: 'Jaini', time: DateTime.parse("2021-07-19 20:18:04"), imageURL: 'images/forFlutterDP5.jpg', messageText: ['Hello5']),
    ChatUser(name: 'Remy', time: DateTime.parse("2021-07-20 20:18:04"), imageURL: 'images/forFlutterDP6.jpg', messageText: ['Hello6']),
    ChatUser(name: 'Rayson', time: DateTime.parse("2020-07-20 20:18:04"), imageURL: 'images/forFlutterDP7.jpg', messageText: ['Hello7']),
    ChatUser(name: 'Jo', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP8.jpg', messageText: ['Hello8']),
    ChatUser(name: 'Joe', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP9.jpg', messageText: ['Hello9']),
    ChatUser(name: 'Joe', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP9.jpg', messageText: ['Hello9']),
    ChatUser(name: 'Joe', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP9.jpg', messageText: ['Hello9']),
  ];

  TextEditingController searchBarController = new TextEditingController();

  generateChats(List chats){
    int indexNum = 0;
    var chatList = <Widget>[];

    chatList.add(SizedBox(height: 25));
    chats.forEach((chat) {
      chatList.add(individualChatWidget(individualChat: chat)
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
          children: generateChats(chatUsers)
        )
    );
  }
}



