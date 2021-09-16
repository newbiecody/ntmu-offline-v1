class forumPostHeaderInfo{
  String leadingContent;
  List<String> likedBy;
  List<String> comments;
  String originalPoster;
  DateTime timeOfPost;

  forumPostHeaderInfo({required this.leadingContent,required this.originalPoster,required this.timeOfPost, required this.comments, required this.likedBy});
}