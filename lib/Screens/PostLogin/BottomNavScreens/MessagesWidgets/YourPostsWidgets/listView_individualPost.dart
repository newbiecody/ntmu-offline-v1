import 'package:flutter/material.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/ForumWidgets/openForumThread.dart';

class individualPostWidget extends StatefulWidget{
  ForumPostHeaderInfo postHeaderInfo;
  String username;
  individualPostWidget({Key? key, required this.postHeaderInfo, required this.username});

  @override
  State<individualPostWidget> createState() => individualPostWidgetState();
}

class individualPostWidgetState extends State<individualPostWidget> {

  generateNumOfCommentsString(int numOfComments){
    if(numOfComments>1){
      return (numOfComments.toString() + ' comments');
    }
    else{
      return (numOfComments.toString() + ' comment');
    }
  }

  generateNumOfLikesString(int numOfLikes){
    if(numOfLikes>1){
      return (numOfLikes.toString() + ' likes');
    }
    else{
      return (numOfLikes.toString() + ' like');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(OpenForumThread(individualPost : widget.postHeaderInfo, username: widget.username,))));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black
              )
          ),
          child: Column(
            children: <Widget>[
              Text(widget.postHeaderInfo.headerContent.trim()),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(generateNumOfCommentsString(widget.postHeaderInfo.comments.length)),
                  SizedBox(width: 10),
                  Text(generateNumOfLikesString(widget.postHeaderInfo.likedBy.length)),
                  SizedBox(width: 15)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}