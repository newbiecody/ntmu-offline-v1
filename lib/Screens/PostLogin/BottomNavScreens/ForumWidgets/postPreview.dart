import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';



class PostPreview extends StatefulWidget{

  ForumPostHeaderInfo postData;
  bool editFlag;  //if editFlag == true, post preview is showing edited post.
  PostPreview({Key? key, required this.postData, required this.editFlag}) : super(key:key);

  @override
  State<PostPreview> createState() => PostPreviewState();
}

class PostPreviewState extends State<PostPreview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(onPressed: (){
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Confirmation'),
                    content: widget.editFlag ? Text('Confirm current changes?') : Text('Upload post?'),//edit this
                    actions: <Widget>[
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.pop(context);
                          if(widget.editFlag == true){
                            //confirm changes to forum posts
                          }else{
                            //upload post to forums
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'No'),
                        child: const Text('No'),
                      ),
                    ],
                  ));
            },
                icon: Icon(Icons.check))
          ],
          leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              );
            },
          ),
          title: const Text('Post Preview'),
          centerTitle: true,
        ),
    body: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text(widget.postData.headerContent,
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
          ),
          Text('Posted by ' + widget.postData.originalPoster + ' - ' + timeFromNow(widget.postData.timeOfPost),
            style: TextStyle(
            fontSize: 12
            ),
          ),
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.postData.headerContent,
              style: TextStyle(
                fontSize: 16
                ),
              ),
          ),
          Visibility(
            visible: (widget.postData.tags.length > 0) ? true : false,
            child: Wrap(
              spacing: 16.0,
              runSpacing: 8.0,
              children: generateTags(widget.postData.tags)),
          ),
          SizedBox(height: 15)
          ])
          )
        )
      )
    );
    }

}