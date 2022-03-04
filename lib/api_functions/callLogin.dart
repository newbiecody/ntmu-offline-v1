import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ntmu/Models/UserInfo_secure.dart';
import 'package:ntmu/Models/imgModel.dart';
import 'package:ntmu/api_functions/apiMessageDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:sqflite/sqflite.dart';

import '../Components/database_helper.dart';
import '../Components/functs.dart';
import 'package:path/path.dart';

import '../Screens/PostLogin/baseScreen_postLogin.dart';


Future saveToken(String token) async{
  print("Saving token...");
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("lastReceivedToken", token);
}

Future checkForToken() async{
  print("Checking for token...");
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final String? token = preferences.getString("lastReceivedToken");
  return token;
}

Future <void> requestLoginToken(String username, String password) async {
  print("Signing in...");
  final url = Uri.parse("http://10.0.2.2:8000/api_ntmuMobile/api-auth-token/");

  // UserModel user;
  // List <MatchModel> match= [];

  Map <String, String> body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(url, body: body);

  if(response.statusCode == 200){
    final responseJson = json.decode(response.body);
    saveToken(responseJson["token"]);
    // print(responseJson["token"]);
  }else{
    // return false;
  }
  // return true;
}

Future updateSharedPrefs_userInfo(response) async{
  print("Updating user info...");
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var data = json.decode(response);
  await preferences.setString("ntmu_email", data['email']);
  await preferences.setString("ntmu_username", data['username']);
  await preferences.setString("ntmu_fullname", data['full_name']);
  await preferences.setString("ntmu_birthday", data['birthday']);
  await preferences.setString("ntmu_gender", data['gender']['name']);
  await preferences.setString("ntmu_hobbies", data['hobbies']);
  await preferences.setString("ntmu_countryOfOrigin", data['country_of_origin']['name']);
  await preferences.setString("ntmu_religion", data['religion']['name']);
  await preferences.setString("ntmu_profileDesc", data['profile_desc']);
  await preferences.setString("ntmu_course", data['course']['name']);
  await preferences.setString("ntmu_matriculationYear", data['matriculation_year'].toString());
  await preferences.setString("ntmu_avatar_url", data['avatar_url']);
}

retrieveSharedPrefs_userInfo(List<String> toRetrieve) async{
  print("Retrieving user info from shared preferences...");
  Map data = {};
  // Arguments include:
  // username, email,  fullname,  birthday,  gender,  hobbies,  countryOfOrigin, religion, profileDesc, course, matriculationYear, avatar_url
  SharedPreferences preferences = await SharedPreferences.getInstance();
  toRetrieve.forEach((arg) async {
    data[arg] = preferences.getString("ntmu_$arg");
  });
  return data;
}

Future <void> saveProfilePicture() async {
  print("Saving profile picture...");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? url = await prefs.getString("ntmu_avatar_url");

  // Download image
  final ByteData imageData = await NetworkAssetBundle(Uri.parse("http://10.0.2.2:8000" + url!)).load("");
  final Uint8List bytes = imageData.buffer.asUint8List();
  final String base64Img = base64Encode(bytes);
  // Create imgData object
  final data = imgData(id: 0, data: base64Img);
  // Open database
  String dbPath = await getDatabasesPath();
  String path = join(dbPath, "db_ntmu");
  await createPath(dbPath);
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
      // When creating the db, create the table
        await db.execute(
            'CREATE TABLE ntmu_img(id INTEGER PRIMARY KEY, data TEXT)');
  });
  // Insert data
  await insertImgData(data, database);
  print("Profile image saved!");
}

Future retrieveUserInfo() async{
  print("Fetching token...");
  final url = Uri.parse("http://10.0.2.2:8000/api_ntmuMobile/user-profile/");
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = await checkForToken();
  int counter = 0;
  while(token==null){
    await Future.delayed(const Duration(seconds: 2), (){counter +=1;});
    if(counter==3){
      print("Timeout...");
      break;
    }

  }
  if(token!=null){
    var headers = {
      'Authorization': 'Token $token'
    };
    final response = await http.get(url, headers: headers);
    print(response.body);
    await updateSharedPrefs_userInfo(response.body);
  }
}

login(BuildContext context, String username, String password) async{

  try{
    await requestLoginToken(username, password);
    await retrieveUserInfo(); // From server
    await saveProfilePicture();

    List <String> list_dataToFetch = ['username', 'email', 'fullname', 'birthday', 'gender', 'hobbies', 'religion', 'countryOfOrigin', 'profileDesc', 'course', 'matriculationYear'];
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = await retrieveSharedPrefs_userInfo(list_dataToFetch);
    var loginDataPacket = new UserInfoFlexi_noPassword();
    loginDataPacket.fromJson(userData);


    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BaseScreen_postLogin(userData: loginDataPacket)), (route) => false);
    }on Exception{
      showApiMessageDialog(context, "Error", "There was an error with sign in, please try again later.");
    }

}

