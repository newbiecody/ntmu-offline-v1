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
      commentSection.add(SizedBox(height: 15));
      // Username
      commentSection.add(
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: MediaQuery.of(context).size.width*.85,
            alignment: Alignment.bottomRight,
            child: Text(commentObject.commentingUser,
                style: TextStyle(
                    fontSize: 12
                )
            ),
          )
      );
      // Main comment
      var commentContent = '${commentObject.comment}';
      commentSection.add(
          Text(commentContent,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal
          )
          )
      );

      commentSection.add(
        SizedBox(height: 16)
      );
    });
    return commentSection.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: generateComments(widget.individualPost.comments),
    );

  }


}