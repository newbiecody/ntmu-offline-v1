import 'package:ntmu/Models/CommentObject.dart';

class ForumPostHeaderInfo{
  String headerContent;
  String mainContent;
  List<String> likedBy;
  List<Comment> comments;
  String originalPoster; //If the post is owned by user, originalPoster is set to 'me'. Else, set originalPoster to 'name_of_user'
  DateTime timeOfPost;
  DateTime? lastLikedDateTime;
  List<String> tags;

  ForumPostHeaderInfo({required this.headerContent,required this.mainContent,required this.originalPoster,required this.timeOfPost, required this.comments, required this.likedBy, required this.lastLikedDateTime, required this.tags});
}