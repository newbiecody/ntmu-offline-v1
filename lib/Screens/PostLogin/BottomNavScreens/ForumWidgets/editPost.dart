import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/ForumWidgets/postPreview.dart';

import '../../../../Components/functs.dart';

class EditPost extends StatefulWidget{
  ForumPostHeaderInfo postInfo;
  EditPost({Key? key, required this.postInfo}) : super(key:key);

  @override
  State<EditPost> createState() => EditPostState();
}

class EditPostState extends State<EditPost> {

  //final mainContentFieldController = TextEditingController();
  // void initState() {
  //   super.initState();
  //   mainContentFieldController.addListener(() {
  //     // final String text = mainContentFieldController.text.toLowerCase();
  //     mainContentFieldController.value = mainContentFieldController.value.copyWith(
  //       text: widget.postInfo.mainContent,
  //       // selection:
  //       // TextSelection(baseOffset: text.length, extentOffset: text.length),
  //       composing: TextRange.empty,
  //     );
  //   });
  // }
  //String initialMainContentString = widget.postInfo.mainContent;
  final mainContentFieldController = TextEditingController();
  void initState() {
    super.initState();
    mainContentFieldController.text = widget.postInfo.headerContent;
    mainContentFieldController.addListener(() {
      String text = mainContentFieldController.text;
      mainContentFieldController.value = mainContentFieldController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    mainContentFieldController.dispose();
    super.dispose();
  }
  // generateTextEditingController(String maincontent){
  //   final mainContentFieldController = TextEditingController(text: maincontent);
  //   return mainContentFieldController;
  // }
  //


  generatePostDataPacket(ForumPostHeaderInfo postInfo, String mainContent){
    return ForumPostHeaderInfo(
        topicID: postInfo.topicID,
        headerContent: postInfo.headerContent,
        mainContent: mainContent,
        originalPoster: postInfo.originalPoster,
        timeOfPost: postInfo.timeOfPost,
        comments: postInfo.comments,
        likedBy: postInfo.likedBy,
        lastLikedDateTime: postInfo.lastLikedDateTime,
        tags: postInfo.tags
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(PostPreview(postData: generatePostDataPacket(widget.postInfo, mainContentFieldController.text), editFlag: true,))));
            },
            icon: Icon(Icons.check))
          ],
          leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Discarding changes'),
                          content: const Text('All your changes will be lost. Do you want to exit?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: (){
                                Navigator.pop(context);
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
                  }
              );
            },
          ),
          title: const Text('Edit Post'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(widget.postInfo.headerContent,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: mainContentFieldController,
                    decoration: new InputDecoration.collapsed(hintText: 'What\'s on your mind?'),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Wrap(
                      spacing: 16.0,
                      runSpacing: 8.0,
                      children: generateTags(widget.postInfo.tags)),
                ),
                SizedBox(height: 15)
              ],
            ),
          ),
        ),
      ),
    );
  }

}