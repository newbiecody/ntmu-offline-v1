import 'package:flutter/material.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/MenuItem.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/Screens/PostLogin/CommentSection.dart';

class OpenForumThread extends StatefulWidget{
  ForumPostHeaderInfo individualPost;
  String username;
  OpenForumThread({Key? key, required this.individualPost, required this.username});
  @override
  State<OpenForumThread> createState() => OpenForumThreadState();
}

class OpenForumThreadState extends State<OpenForumThread> {

  final commentController = new TextEditingController();

  setPopupMenuOptions(String username, ForumPostHeaderInfo postInfo){
    List<PopupMenuItem> popupMenuItems = [];
    // List<MenuItem> MenuItems = [
    //   MenuItem(menuItem_icon: Icon(Icons.flag_rounded), menuItem_name: 'Flag post'),
    //   MenuItem(menuItem_icon: Icon(Icons.share_outlined), menuItem_name: 'Share'),
    //
    // ];
    if(username != postInfo.originalPoster){
      setState(() {
        popupMenuItems = [
          //MenuItem(menuItem_icon: Icon(Icons.flag_rounded), menuItem_name: 'Flag post'),
          //MenuItem(menuItem_icon: Icon(Icons.share_outlined), menuItem_name: 'Share'),
          PopupMenuItem<MenuItem>(child: Text('Flag post'), value: 0),
        ];
      });
      //static const List<MenuItem> MenuItems = [
      //do nothing
    }
    else{
      setState(() {
        popupMenuItems = [
          // MenuItem(menuItem_icon: Icon(Icons.flag_rounded), menuItem_name: 'Flag post'),
          // MenuItem(menuItem_icon: Icon(Icons.share_outlined), menuItem_name: 'Share'),
          // MenuItem(menuItem_icon: Icon(Icons.edit), menuItem_name: 'Edit post'),
          // MenuItem(menuItem_icon: Icon(Icons.delete), menuItem_name: 'Delete post')
          PopupMenuItem(child: Text('Flag post'), value: 0),
          PopupMenuItem(child: Text('Edit post'), value: 1),
          PopupMenuItem(child: Text('Delete post'), value: 2)
        ];
      });
    }
    return popupMenuItems;
  }

  // static const List<MenuItem> MenuItems = [
  //   MenuItem(menuItem_icon: Icon(Icons.flag_rounded), menuItem_name: 'Flag post'),
  //   MenuItem(menuItem_icon: Icon(Icons.share_outlined), menuItem_name: 'Share'),
  //   MenuItem(menuItem_icon: Icon(Icons.edit), menuItem_name: 'Edit post'),
  //   MenuItem(menuItem_icon: Icon(Icons.delete), menuItem_name: 'Delete post'),
  // ];


  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(

      child: Row(
       children: [
         item.menuItem_icon,
         Text(item.menuItem_name),
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
            onSelected: (popupMenuSelection){
              if(popupMenuSelection == 1){
                print('flag');
              }else if(popupMenuSelection == 2){
                print('edit');
              }else if(popupMenuSelection == 3){
                print('delete');
              }
            },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[setPopupMenuOptions(widget.username, widget.individualPost)]
              //itemBuilder: (context) => [...setPopupMenuOptions(widget.username, widget.individualPost).map(buildItem).toList()]
              //[...setPopupMenuOptions(widget.username, widget.individualPost).map(buildItem).toList()]
              //[...MenuItems.map(buildItem).toList()]
          )
        ]

        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(widget.individualPost.headerContent,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('Posted by ' + widget.individualPost.originalPoster + ' - ' + timeFromNow(widget.individualPost.timeOfPost),
                style: TextStyle(
                  fontSize: 12
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.individualPost.mainContent,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),
              Wrap(
                spacing: 16.0,
                runSpacing: 8.0,
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
                  Expanded(
                    child: SizedBox(),
                  ),
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
              Container(
                padding: EdgeInsets.fromLTRB(0,0,0,8),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: commentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    filled: true,
                    fillColor: Color(0X3399DDC8),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: (){
                      if(commentController.text.trim() == ''){
                        //do nothing
                      }else{
                        setState(() {
                          //widget.individualPost.comments.add(Comment(commentingUser: ))
                        });
                        //post comment
                      }
                    },
                    child: Text(
                        'Comment'
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35)),
                    )
                ),
              ),
              Divider(thickness: 1),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                  ),
                ),
              ),
              CommentSection(individualPost: widget.individualPost)
            ],
          ),
        ),
      ),
      );

  }


}