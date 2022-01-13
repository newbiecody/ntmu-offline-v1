import 'package:flutter/material.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/MenuItem.dart';

class CommentSection extends StatefulWidget{
  ForumPostHeaderInfo individualPost;
  CommentSection({Key? key, required this.individualPost});
  @override
  State<CommentSection> createState() => CommentSectionsState();
}

class CommentSectionsState extends State<CommentSection> {

  generateComments(comments){
    List <Widget> commentSection = [];
    comments.forEach((commentObject){

      commentSection.add(
          Text(commentObject.comment,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
          )
      );
      commentSection.add(
          Text(commentObject.commentingUser.fullName,
              style: TextStyle(
                  fontSize: 12
              )
          )
      );
      commentSection.add(
        SizedBox(height: 16)
      );
    });
    return commentSection;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: generateComments(widget.individualPost.comments),
    );

  }


}