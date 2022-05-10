import 'package:flutter/material.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/MenuItem.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/ForumWidgets/editPost.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/ForumWidgets/newPost.dart';
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
    List popupMenuActions = [];
    if(username != postInfo.originalPoster){
      setState(() {
        popupMenuActions = ['Flag'];
      });
      //static const List<MenuItem> MenuItems = [
      //do nothing
    }
    else{
      setState(() {
        popupMenuActions = ['Flag', 'Edit', 'Delete'];
      });
    }
    return popupMenuActions;
  }

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
          PopupMenuButton(itemBuilder: (BuildContext context){
            return setPopupMenuOptions(widget.username, widget.individualPost).map<PopupMenuEntry>((menuitem) => PopupMenuItem(
                child: Text(menuitem),
                value: menuitem
            )
            ).toList();
          },
        onSelected: (menuitem){
            print(menuitem);
            setState(() {
              if(menuitem == 'Flag'){

              }else if(menuitem == 'Edit'){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(EditPost(postInfo: widget.individualPost))));
              }else if(menuitem == 'Delete'){
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete post'),
                      content: const Text('Are you sure you want to delete your post? This action is irreversible.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            //Delete from database
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'No'),
                          child: const Text('No'),
                        ),
                      ],
                    ));
              };

            });
        },
          )
        ]),
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
                child: Text(widget.individualPost.headerContent,
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
                  // IconButton(
                  //     onPressed: (){},
                  //     icon: Icon(Icons.arrow_circle_up_outlined)),
                  // Text(widget.individualPost.likedBy.length.toString()),
                  // IconButton(
                  //     onPressed: (){},
                  //     icon: Icon(Icons.arrow_circle_down_outlined)),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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