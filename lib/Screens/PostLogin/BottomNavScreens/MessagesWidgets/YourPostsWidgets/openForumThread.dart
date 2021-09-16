import 'package:flutter/material.dart';
import 'package:ntmu/Models/forumPostHeaderInfo.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/YourPostsWidgets/openForumThread.dart';

import 'dart:math';

class OpenForumThread extends StatefulWidget{
  forumPostHeaderInfo individualPost;
  OpenForumThread({Key? key, required this.individualPost});
  @override
  State<OpenForumThread> createState() => OpenForumThreadState();
}

class OpenForumThreadState extends State<OpenForumThread> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder:
            (BuildContext context){
          return IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.pop(context),
          );
        }
        ),
        title: Text('Edit preferences'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              saveProfileEdits();
            },
            icon: Icon(Icons.check))
        ],
      ),
      );
  }


}