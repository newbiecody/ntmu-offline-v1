import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Models/GeneralAccountInfo.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:ntmu/Models/CommentObject.dart';

import 'openForumThread.dart';

class forumPage extends StatefulWidget{
  UserInfo userData;
  forumPage({Key? key, required this.userData}) : super(key:key);

  @override
  State<forumPage> createState() => forumPageState();
}

class forumPageState extends State<forumPage>{
  //Test info
  List <ForumPostHeaderInfo> forumPagePosts = [
    ForumPostHeaderInfo(headerContent: 'What the heck is happening', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', likedBy: [], comments: [Comment(commentingUser: account1, comment: 'Cool post!')], originalPoster: 'Danny', lastLikedDateTime: null, timeOfPost: DateTime.now(), tags: []),
    ForumPostHeaderInfo(headerContent: 'I\'m just testing 1', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', likedBy: ['Jonng'], comments: [Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account2, comment: 'LOL')], originalPoster: 'Jamie', lastLikedDateTime: DateTime.parse("2021-10-15 20:18:04"), timeOfPost: DateTime.now(), tags: ['Testing3211', 'Testing311', 'Testing154', 'Testing154', 'Testing154', 'Testing154', 'Testing154', 'Testing154', 'Testing154']),
    ForumPostHeaderInfo(headerContent: 'I\'m just testing 2', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', likedBy: ['Louis', 'Jamie'], comments: [Comment(commentingUser: account2, comment: 'Okay? sure!')], originalPoster: 'Anwar', lastLikedDateTime: DateTime.parse("2021-10-16 20:18:04"), timeOfPost: DateTime.now(), tags: ['Testing541', 'Testing1754', 'Testing1']),
    ForumPostHeaderInfo(headerContent: 'I\'m just testing 23', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', likedBy: ['Louis', 'Jamie'], comments: [Comment(commentingUser: account3, comment: 'That\'s dope! Hit me up!'), Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account4, comment: 'Cool post!')], originalPoster: 'Josiah', lastLikedDateTime: DateTime.parse("2021-10-17 20:18:04"), timeOfPost: DateTime.now(), tags: ['Testing7751','Testing451']),
    ForumPostHeaderInfo(headerContent: 'I\'m just testing 41', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', likedBy: ['Louis', 'John'], comments: [Comment(commentingUser: account9, comment: 'Cool post!'), Comment(commentingUser: account8, comment: 'Cool post!'), Comment(commentingUser: account7, comment: 'Cool post!')], originalPoster: 'John', lastLikedDateTime: DateTime.parse("2021-10-18 20:18:04"), timeOfPost: DateTime.now(), tags: ['Testing761']),
    ForumPostHeaderInfo(headerContent: 'I\'m just testing 10', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', likedBy: ['Louis', 'Josiah'], comments: [Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account1, comment: 'Cool post!')], originalPoster: 'Harry', lastLikedDateTime: DateTime.parse("2021-10-19 20:18:04"), timeOfPost: DateTime.now(), tags: ['Testing1657'])
  ];
  //end of test info


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     ElevatedButton(
          //         onPressed: (){
          //
          //         },
          //         child: Text(
          //             'Popular'
          //         ),
          //         style: ElevatedButton.styleFrom(
          //             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
          //             minimumSize: Size(100,35)
          //         )
          //     ),
          //     SizedBox(width: 50),
          //     ElevatedButton(
          //         onPressed: (){
          //
          //         },
          //         child: Text(
          //             'Newest'
          //         ),
          //         style: ElevatedButton.styleFrom(
          //             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
          //             minimumSize: Size(100,35)
          //         )
          //     )
          //   ],
          // ),
          Divider(thickness: 1),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: forumPagePosts.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(OpenForumThread(individualPost: forumPagePosts[index], username: widget.userData.name,))));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('${forumPagePosts[index].originalPoster} - ${timeFromNow(forumPagePosts[index].timeOfPost)}',
                                style: TextStyle(
                                  fontSize: 12
                                ),
                                )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(forumPagePosts[index].headerContent,
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.arrow_circle_up_outlined)),
                                  Text(forumPagePosts[index].likedBy.length.toString()),
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.arrow_circle_down_outlined))
                                ],
                              ),
                              Expanded(
                                  child: SizedBox(
                                    height: 12,
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:20),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.chat_bubble_outline),
                                    SizedBox(width: 8.0),
                                    Text(forumPagePosts[index].comments.length.toString())
                                  ]
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 8,
                              children: generateTags(forumPagePosts[index].tags),
                            ),
                          ),
                        ),
                        Divider(thickness: 1)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );}
}
