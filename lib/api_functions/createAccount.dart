import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ntmu/Models/UserInfo.dart';
import 'package:http/http.dart' as http;

import '../Components/functs.dart';
import '../common/GLOBAL_SETTINGS.dart';
import 'apiMessageDialog.dart';
import 'callLogin.dart';



Future createAccountAPI(BuildContext context, UserInfo signupDataPacket) async {
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/signup/");
  List <String> list_hobbiesByID = [];
  signupDataPacket.hobbies.forEach((hobby) {
    list_hobbiesByID.add(PopulateSignupFormData.map_HobbiesWithID[hobby].toString());

  });



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
    await saveToken(responseJson["token"]);
    await login_withToken(context);
  }else{
    showApiMessageDialog(context, "Login error", "There seems to be an error logging you in, please try again.");
  }

}