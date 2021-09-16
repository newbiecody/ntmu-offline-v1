import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/forumPostHeaderInfo.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/listView_individualChat.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/YourPostsWidgets/listView_individualPost.dart';

import 'YourPostsWidgets/openForumThread.dart';


class yourPosts extends StatefulWidget{
  bool isPanelOpenNow;
  yourPosts({Key? key, required this.isPanelOpenNow}) : super(key:key);
  @override
  State<yourPosts> createState() => yourPostsState();
}

/*
String leadingContent;
int countLikes;
int countComments;
String originalPoster;
DateTime timeOfPost;
*/

class yourPostsState extends State<yourPosts>{

  List <forumPostHeaderInfo> forumPostsByUser = [
    forumPostHeaderInfo(leadingContent: 'Hello does anybody want to study together?', originalPoster: 'me', timeOfPost: DateTime.parse("2021-07-20 20:18:04"), comments: ['Me', 'Count me in', 'Definitely me'], likedBy: ['Amarla, Jacob']),
    forumPostHeaderInfo(leadingContent: 'Hello does anybody want to eat together?', originalPoster: 'me', timeOfPost: DateTime.parse("2021-08-25 20:18:04"), comments: ['Me', 'Count me in', 'Definitely me', 'me as well'],  likedBy: ['Joanne, John, Jumin']),
    forumPostHeaderInfo(leadingContent: 'Hello does anybody want to play together?', originalPoster: 'me', timeOfPost: DateTime.parse("2021-08-28 10:18:04"), comments: ['Me', 'Count me in', 'Definitely me', 'me as well','me lol'], likedBy: ['Dan, Hamsworn']),
  ];

  generateListOfUserPosts(List forumPostsByUser){
    var listView_userPosts = <Widget>[];
    forumPostsByUser.forEach((post){
      listView_userPosts.add(
        individualPostWidget(postHeaderInfo: post)
      );
      listView_userPosts.add(Divider(thickness: 1));
    });
    return listView_userPosts;
  }


  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: generateListOfUserPosts(forumPostsByUser),
      ),
    );
  }
}
