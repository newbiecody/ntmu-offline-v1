import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Models/GeneralAccountInfo.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/ChatsWidgets/IndividualChatWidget.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/MessagesWidgets/YourPostsWidgets/listView_individualPost.dart';
import 'package:ntmu/Models/CommentObject.dart';

import '../ForumWidgets/openForumThread.dart';


class yourPosts extends StatefulWidget{
  bool isPanelOpenNow;
  String username;
  yourPosts({Key? key, required this.isPanelOpenNow, required this.username}) : super(key:key);
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

  // List <ForumPostHeaderInfo> forumPostsByUser = [
  //   ForumPostHeaderInfo(topicID: '0', headerContent: 'Hello does anybody want to study together?', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', originalPoster: 'Test User 1', timeOfPost: DateTime.parse("2021-07-20 20:18:04"), comments: [
  //     Comment(commentingUser: account1, comment: 'Sure, sign me up.'),
  //     Comment(commentingUser: account2, comment: 'Sure, sign me up.'),
  //     Comment(commentingUser: account3, comment: 'Sure, sign me up.'),
  //     Comment(commentingUser: account4, comment: 'Sure, sign me up.'),
  //     Comment(commentingUser: account5, comment: 'Sure, sign me up.'),
  //   ], likedBy: ['Amarla, Jacob'], lastLikedDateTime: DateTime.parse("2021-10-20 20:18:04"), tags: []),
  //   ForumPostHeaderInfo(topicID: '0', headerContent: 'Hello does anybody want to eat together?', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', originalPoster: 'Test User 1', timeOfPost: DateTime.parse("2021-08-25 20:18:04"), comments: [
  //     Comment(commentingUser: account1, comment: 'Why not? 1'),
  //     Comment(commentingUser: account2, comment: 'Why not? 2'),
  //     Comment(commentingUser: account3, comment: 'Why not? 3'),
  //     Comment(commentingUser: account4, comment: 'Why not? 4'),
  //     Comment(commentingUser: account5, comment: 'Why not? 5'),
  //   ],  likedBy: ['Joanne, John, Jumin'], lastLikedDateTime: DateTime.parse("2021-10-20 20:18:04"), tags: []),
  //   ForumPostHeaderInfo(topicID: '0', headerContent: 'Hello does anybody want to play together?', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', originalPoster: 'Test User 1', timeOfPost: DateTime.parse("2021-08-28 10:18:04"), comments: [
  //     Comment(commentingUser: account1, comment: 'Why not? 8'),
  //     Comment(commentingUser: account2, comment: 'Why not? 9'),
  //     Comment(commentingUser: account3, comment: 'Why not? 10'),
  //     Comment(commentingUser: account4, comment: 'Why not? 11'),
  //     Comment(commentingUser: account5, comment: 'Why not? 12'),
  //   ], likedBy: ['Dan, Hamsworn'], lastLikedDateTime: DateTime.parse("2021-10-20 20:18:04"), tags: []),
  // ];

  generateListOfUserPosts(List forumPostsByUser){
    var listView_userPosts = <Widget>[];
    forumPostsByUser.forEach((post){
      listView_userPosts.add(
        individualPostWidget(postHeaderInfo: post, username: widget.username)
      );
      listView_userPosts.add(Divider(thickness: 1));
    });
    listView_userPosts.add(SizedBox(height: 150));
    return listView_userPosts;
  }


  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        // children: generateListOfUserPosts(forumPostsByUser),
      ),
    );
  }
}
