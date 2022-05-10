import 'package:flutter/material.dart';
import 'package:ntmu/Components/functs.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';
import 'package:ntmu/Models/CommentObject.dart';
import 'package:ntmu/Models/GeneralAccountInfo.dart';
import '../YourPostsWidgets/listView_individualPost.dart';



class notifications extends StatefulWidget{
  String username;
  bool isPanelOpenNow;
  notifications({Key? key, required this.isPanelOpenNow, required this.username}) : super(key:key);
  @override
  State<notifications> createState() => notificationsState();
}

class notificationsState extends State<notifications>{


  generateMatchRequests(List<Object> users){

  }

  // List <ForumPostHeaderInfo> postNotifications = [
  //   ForumPostHeaderInfo(headerContent: 'Hello does anybody want to study together?', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut porttitor metus et euismod pellentesque. Nulla eleifend vel orci nec scelerisque. In pretium egestas erat, sed mollis nibh pretium feugiat. Sed rutrum gravida diam. Fusce vel commodo neque. Nunc non mi fringilla, consectetur erat sed, efficitur orci. Sed blandit faucibus condimentum. Vestibulum in ullamcorper tellus. Donec ut justo eget mauris condimentum accumsan. Nullam quis tellus at tellus faucibus bibendum. Cras eu porttitor ex. Integer vulputate dolor ut facilisis tristique. Integer in nunc vitae leo pulvinar posuere et quis nibh. Sed non vehicula tortor.Ut vulputate at diam ac sodales. In aliquam at massa non varius. Sed ut volutpat mauris, sed varius nulla. Phasellus ultrices massa eget egestas pretium. Duis rutrum arcu ex, ut accumsan nisl cursus et. Duis imperdiet cursus mauris, non porta velit. Mauris non odio rutrum, tincidunt risus eget, finibus quam.Nam lobortis sollicitudin nunc sit amet commodo. Vestibulum malesuada elit eu pulvinar scelerisque. Sed volutpat diam lorem, at blandit felis egestas at. Aliquam lobortis lacinia rutrum. Nam ultricies tortor rhoncus ante ultrices tristique laoreet et libero. Maecenas vel nisi sit amet libero rhoncus dictum eu eget ex. Nullam felis orci, rutrum vel aliquam quis, cursus et metus.Sed ultricies convallis tortor at sagittis. Ut condimentum blandit orci et vestibulum. Morbi a varius mi. Fusce ut velit vel justo bibendum finibus non a sapien. Maecenas tempus elit vitae hendrerit condimentum. Integer faucibus, velit vitae aliquam tempus, justo lacus interdum leo, eget posuere arcu nibh non ligula. Nam sollicitudin lectus purus, et porta nunc sagittis nec. Praesent tempor mauris eget nisi pretium placerat. Phasellus id neque ornare, dignissim turpis at, iaculis urna. Nunc euismod vestibulum diam ut pretium. Praesent ullamcorper faucibus mauris. Curabitur porta massa et ultricies congue. Quisque semper nulla et nunc convallis, nec porttitor felis vestibulum. Fusce rutrum egestas blandit. Integer velit lacus, vehicula et leo quis, egestas pharetra justo. Praesent eu ex vitae dolor scelerisque tempor eu ut nisl. Nullam sed eros tempus, congue diam vitae, euismod lectus. In consequat sodales leo in auctor. In in dui euismod, facilisis est ac, vehicula orci. Suspendisse aliquet arcu vitae urna interdum malesuada. Fusce interdum rhoncus leo, nec tristique erat vulputate sed. Donec luctus non augue sodales dapibus. Praesent vestibulum eros elit, tempus feugiat diam condimentum ut. Curabitur et lorem euismod, fermentum metus id, vestibulum purus. Vestibulum accumsan elementum nibh. Aliquam scelerisque turpis ut fringilla euismod. Suspendisse magna ipsum, pellentesque quis efficitur et, eleifend eu ex.',originalPoster: 'Test User 1', timeOfPost: DateTime.parse("2021-07-20 20:18:04"), comments: [Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!')], likedBy: ['Amarla', 'Jacob'], lastLikedDateTime: DateTime.parse("2021-10-20 20:18:04"), tags: ['Testing', 'Computer Science']),
  //   ForumPostHeaderInfo(headerContent: 'Hello does anybody want to eat together?', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', originalPoster: 'Test User 1', timeOfPost: DateTime.parse("2021-08-25 20:18:04"), comments: [Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Cool post!'), Comment(commentingUser: account1, comment: 'Cool post!')],  likedBy: ['Joanne', 'John', 'Jumin'], lastLikedDateTime: DateTime.parse("2021-10-20 20:18:04"), tags: ['Testing', 'Computer Science']),
  //   ForumPostHeaderInfo(headerContent: 'Hello does anybody want to play together?', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', originalPoster: 'Test User 1', timeOfPost: DateTime.parse("2021-08-28 10:18:04"), comments: [Comment(commentingUser: account2, comment: 'Me!'), Comment(commentingUser: account4, comment: 'Me!'), Comment(commentingUser: account3, comment: 'Me!'), Comment(commentingUser: account2, comment: 'Me!')], likedBy: ['Dan', 'Hamsworn'], lastLikedDateTime: DateTime.parse("2021-10-20 20:18:04"), tags: []),
  //   ForumPostHeaderInfo(headerContent: 'Hello does anybody want to play together?', mainContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', originalPoster: 'Test User 1', timeOfPost: DateTime.parse("2021-08-28 10:18:04"), comments: [Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!'), Comment(commentingUser: account1, comment: 'Me!')], likedBy: ['Dan', 'Hamsworn'], lastLikedDateTime: DateTime.parse("2021-10-20 20:18:04"), tags: []),
  // ];

  generateNotifications(List <ForumPostHeaderInfo> notifications){
    List <Widget> notificationsList = [];
    notifications.forEach((element) {
      if(element.likedBy.length > 2) {
        notificationsList.add(Column(
          children: [
            Text('${element.likedBy.last} and ${element.likedBy.length -
                1} others liked your post 7 hours ago...'),
            individualPostWidget(postHeaderInfo: element, username: widget.username),
            Divider(thickness: 1)
          ],
        )
        );
      }else if(element.likedBy.length == 2){
        notificationsList.add(Column(
          children: [
            Text('${element.likedBy.last} and ${element.likedBy.length - 1} other liked your post 7 hours ago...'),
            individualPostWidget(postHeaderInfo: element, username: widget.username,),
            Divider(thickness: 1)
          ],
        )
        );
      }else if(element.likedBy.length == 1){
        notificationsList.add(Column(
          children: [
            Text('${element.likedBy.last} liked your post 7 hours ago...'),
            individualPostWidget(postHeaderInfo: element, username: widget.username,),
            Divider(thickness: 1)
          ],
        )
        );
      }
    });
    notificationsList.add(SizedBox(height: 150));
    return notificationsList;
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      physics: widget.isPanelOpenNow ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget> [
          SizedBox(height: 25),
          Text('2 people wants to know you better! Get to know them better?'),
          SizedBox(height: 10),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(),
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'Amarla, Year 3 at School of Computer Science and Engineering'
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                      iconSize: 35,
                      onPressed: () {print('seeprofile');},
                      icon: Icon(Icons.pageview_outlined)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(),
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                        'Amarla, Year 3 at School of Computer Science and Engineering'
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                        iconSize: 35,
                        onPressed: () {print('seeprofile');},
                        icon: Icon(Icons.pageview_outlined)),
                  )
                ],
              ),
              SizedBox(height:10)
            ],
          ),
          Divider(thickness: 1),
          Column(
            children: []
            // generateNotifications(postNotifications),
          )

      ]

      ),
    );
  }
}
