import 'package:ntmu/Models/GeneralAccountInfo.dart';

class Comment{
  GeneralAccountInfo commentingUser;
  String comment;

  Comment({required this.commentingUser, required this.comment});
}