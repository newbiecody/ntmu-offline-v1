import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Screens/PostLogin/BottomNavScreens/ForumWidgets/postPreview.dart';
import '../../../../Models/UserInfo_secure.dart';

class NewPost extends StatefulWidget{
  UserInfoFlexi_noPassword userData;
  NewPost({Key? key, required this.userData}) : super(key:key);

  @override
  State<NewPost> createState() => NewPostState();
}

class NewPostState extends State<NewPost> {

  final titleFieldController = TextEditingController();
  final mainContentFieldController = TextEditingController();
  final tagsFieldController = TextEditingController();

  generatePostDataPacket(String title, String mainContent, String tags, UserInfoFlexi_noPassword userinfo){

    List <String> preprocessedTagsList = tags.split(',');
    List <String> processedTagsList = [];
    preprocessedTagsList.forEach((element) {
      processedTagsList.add(element.trim());
    });

    return ForumPostHeaderInfo(
        topicID: '-1',
        headerContent: title,
        mainContent: mainContent,
        originalPoster: userinfo.name!,
        timeOfPost: DateTime.now(),
        comments: [],
        likedBy: [],
        lastLikedDateTime: null,
        tags: processedTagsList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(PostPreview(postData: generatePostDataPacket(titleFieldController.text, mainContentFieldController.text, tagsFieldController.text, widget.userData), editFlag: false))));
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
          title: const Text('New Post'),
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
                  child: TextFormField(
                    controller: titleFieldController,
                    decoration: new InputDecoration.collapsed(hintText: 'Add a title...'),
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
                  child: TextFormField(
                    minLines: 5,
                    maxLines: 30,
                    controller: tagsFieldController,
                    decoration: new InputDecoration.collapsed(hintText: 'Tags...\ni.e. Study, Computer Science, GPA 5.0\n(Seperate tags using a comma!)'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}