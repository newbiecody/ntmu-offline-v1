import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:http/http.dart' as http;

import '../Components/functs.dart';
import 'apiMessageDialog.dart';
import 'callLogin.dart';



Future createAccountAPI(BuildContext context, UserInfo signupDataPacket) async {
  final url = Uri.parse("http://10.0.2.2:8000/api_ntmuMobile/signup/");
  // UserInfo user;
  // // List <MatchModel> match= [];
  List <String> list_hobbiesByID = [];
  signupDataPacket.hobbies.forEach((hobby) {
    list_hobbiesByID.add(PopulateSignupFormData.map_HobbiesWithID[hobby].toString());

  });

  calculateYoM(yearOfStudy){
    var now = new DateTime.now();
    var startOfYear = new DateTime(now.year, 1, 1);
    if(now.month>=8){
      return now.year;
    }else{
      if(now.difference(startOfYear).inDays>212){
        return now.year-yearOfStudy+1;
      }else{
        return now.year-yearOfStudy;
      }
    }
  }

  String yearOfMatriculation = calculateYoM(signupDataPacket.year_of_matriculation).toString();

  Map <String, String> body = {
    'name' : signupDataPacket.name,
    'username': signupDataPacket.username,
    'password': signupDataPacket.password,
    'email' : signupDataPacket.email,
    'date_of_birth': signupDataPacket.birthday.toString(),
    'gender' : signupDataPacket.gender,
    'hobbies' : list_hobbiesByID.join(','),
    'country_of_origin' : signupDataPacket.country_of_origin,
    'religion' : signupDataPacket.religion,
    'description' : signupDataPacket.profile_desc,
    'course_of_study' : signupDataPacket.course + '\n',
    'year_of_matriculation' : yearOfMatriculation,
    'profile_picture' : UserInfoStatic.profilePictureBase64String
  };

  final response = await http.post(url, body: body);

  if(response.statusCode == 200){
    final responseJson = json.decode(response.body);
    saveToken(responseJson["token"]);
  }else{
    showApiMessageDialog(context, "Login error", "There seems to be an error logging you in, please try again.");
  }

}