//used in account creation, possibly reused to retrieve different user data

import 'dart:convert';
import 'dart:io';

import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../Components/functs.dart';

// class UserInfo{
//   late String email;
//   late String name;
//   late DateTime birthday;
//   late String Gender; //Male, Female or OtheSrs
//   late List<String> hobbies;
//   late String religion;
//   late String password;
//   late String profile_desc;
//   late String course;
//   late int year;
//   late String profilePicturePath;
// }


//Testing UserAccount
class UserInfo{
  String username = '';
  String email = '';
  String name = '';
  DateTime birthday = DateTime(1990, 2, 12);
  String gender = '';
  List<String> hobbies = [];
  String religion = '';
  String password = '';
  String profile_desc = '';
  String course = '';
  int year_of_matriculation = 1;
  String country_of_origin = '';
  // Lacking the following properties (set at django)
  // avatar_url
}

class UserInfoStatic{
  static dynamic profilePicture = AssetImage("images/blank-profile-picture-973460.png");
  static var profilePictureBase64String;
}