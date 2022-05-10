import 'package:http/http.dart';
import 'package:ntmu/Models/CommentObject.dart';
import 'package:ntmu/Models/ForumPostHeaderInfo.dart';

import '../Components/forumPosts_static.dart';
import '../common/GLOBAL_SETTINGS.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future getPostInformation(postid_string) async {
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/open-post/");
  final response = await http.post(url, body: {'topic_id' : postid_string});
  List<Comment> list_postReplies = [];
  if(response.statusCode == 200){
    final data = json.decode(response.body);
    data.forEach((commentindex, comment) => {
      list_postReplies.add(Comment(commentingUser: comment['poster_id'], comment: comment['content']))
    });

  }
  return list_postReplies;
}

Future <void> getForumPosts() async {
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/show-posts/");
  final response = await http.get(url);
  ForumPosts.posts = [];
  if(response.statusCode == 200){
    final data = json.decode(response.body);
    data.forEach((postId, post) => {
      ForumPosts.posts.add(ForumPostHeaderInfo(topicID: post['topic_id'], headerContent: post['subject'], mainContent: post['content'], originalPoster: post['poster_id'], timeOfPost: DateTime.parse(post['datetime_created'].replaceFirst('T', ' ')), comments: [], likedBy: [], tags: []))
    });
    for (int i=0; i < ForumPosts.posts.length; i++) {
      ForumPosts.posts[i].comments = await getPostInformation(ForumPosts.posts[i].topicID);
    }

  }
}

