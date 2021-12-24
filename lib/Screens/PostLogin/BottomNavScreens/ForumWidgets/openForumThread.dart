import 'package:flutter/material.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/MenuItem.dart';
import 'package:ntmu/Screens/PostLogin/CommentSection.dart';

class OpenForumThread extends StatefulWidget{
  ForumPostHeaderInfo individualPost;
  OpenForumThread({Key? key, required this.individualPost});
  @override
  State<OpenForumThread> createState() => OpenForumThreadState();
}

class OpenForumThreadState extends State<OpenForumThread> {

  static const List<MenuItem> MenuItems = [
    MenuItem(menuItem_icon: Icon(Icons.flag_rounded), menuItem_name: 'Flag post'),
    MenuItem(menuItem_icon: Icon(Icons.share_outlined), menuItem_name: 'Share')
  ];

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
      child: Row(
       children: [
         item.menuItem_icon,
         Text(item.menuItem_name)
       ],
      )
  );

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
        title: Text('Nice to Meet You'),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuItem>(
              itemBuilder: (context) => [
            ...MenuItems.map(buildItem).toList()
          ]
          )
        ]

        ),
      body: Column(
        children: <Widget>[
          Text(widget.individualPost.headerContent),
          Text('Posted by ' + widget.individualPost.originalPoster + ' - ' + timeFromNow(widget.individualPost.timeOfPost)),
          Text(widget.individualPost.mainContent),
          Wrap(
            spacing: 8.0,
            children: generateTags(widget.individualPost.tags)),
          Row(
            children: <Widget>[
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_circle_up_outlined)),
              Text(widget.individualPost.likedBy.length.toString()),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_circle_down_outlined)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Row(
                    children: <Widget>[
                      Icon(Icons.chat_bubble_outline),
                      SizedBox(width: 8.0),
                      Text(widget.individualPost.comments.length.toString() + '')
                    ]
                )
              ),
            ],
          ),
          Divider(thickness: 1),
          CommentSection(individualPost: widget.individualPost)
        ],
      ),
      );

  }


}