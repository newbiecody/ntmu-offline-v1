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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ],
    );

  }


}