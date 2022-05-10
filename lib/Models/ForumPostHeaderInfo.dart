import 'package:ntmu/Models/CommentObject.dart';

class ForumPostHeaderInfo{
  String topicID;
  String headerContent;
  String? mainContent;
  List<String> likedBy = [];
  List<Comment> comments = [];
  String originalPoster; //If the post is owned by user, originalPoster is set to 'me'. Else, set originalPoster to 'name_of_user'
  DateTime timeOfPost;
  DateTime? lastLikedDateTime;
  List<String> tags = [];

  ForumPostHeaderInfo({required this.topicID, required this.headerContent, this.mainContent,required this.originalPoster,required this.timeOfPost, required this.comments, required this.likedBy, this.lastLikedDateTime, required this.tags});
}