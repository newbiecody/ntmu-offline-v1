import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/dataPacket.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/listView_individualChat.dart';
import 'package:ntmu/Models/chatUser.dart';

class messagesPage extends StatefulWidget{
  dataPacket userData;
  messagesPage({Key? key, required this.userData}) : super(key:key);

  @override
  State<messagesPage> createState() => messagesPageState();
}

class messagesPageState extends State<messagesPage>{

  List<chatUser> chatUsers = [
    chatUser(name: 'Amarla', time: DateTime.parse("2021-07-20 20:18:04"), imageURL: 'images/forFlutterDP1.jpg', messageText: 'Hello1'),
    chatUser(name: 'John', time: DateTime.parse("2021-05-20 20:18:04"), imageURL: 'images/forFlutterDP2.jpg', messageText: 'Hello2'),
    chatUser(name: 'Raini', time: DateTime.parse("2021-06-20 20:18:04"), imageURL: 'images/forFlutterDP3.jpg', messageText: 'Hello3'),
    chatUser(name: 'Jerome', time: DateTime.parse("2021-07-18 20:18:04"), imageURL: 'images/forFlutterDP4.jpg', messageText: 'Hello4'),
    chatUser(name: 'Jaini', time: DateTime.parse("2021-07-19 20:18:04"), imageURL: 'images/forFlutterDP5.jpg', messageText: 'Hello5'),
    chatUser(name: 'Remy', time: DateTime.parse("2021-07-20 20:18:04"), imageURL: 'images/forFlutterDP6.jpg', messageText: 'Hello6'),
    chatUser(name: 'Rayson', time: DateTime.parse("2020-07-20 20:18:04"), imageURL: 'images/forFlutterDP7.jpg', messageText: 'Hello7'),
    chatUser(name: 'Jo', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP8.jpg', messageText: 'Hello8'),
    chatUser(name: 'Joe', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP9.jpg', messageText: 'Hello9'),
    chatUser(name: 'Joe', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP9.jpg', messageText: 'Hello9'),
    chatUser(name: 'Joe', time: DateTime.parse("1969-07-20 20:18:04"), imageURL: 'images/forFlutterDP9.jpg', messageText: 'Hello9'),

  ];
  @override
  Widget build(BuildContext context){
    return Center(
      child:
      ListView.builder(
        itemBuilder: (context, index){
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: individualChatWidget(individualChat: chatUsers[index]));
    },
    itemCount: chatUsers.length,
    )
    );}
}
