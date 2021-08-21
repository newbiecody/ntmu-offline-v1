import 'package:flutter/material.dart';

import 'package:ntmu/Screens/AccountCreation/create_account_email.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_password.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_name.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_birthday.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_study.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_profileDesc.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_hobbies.dart';
import 'package:ntmu/Screens/AccountCreation/create_account_confirmInformation.dart';
import 'package:ntmu/Screens/PostLogin/SettingsDrawer/editPreferences.dart';

import 'package:ntmu/Screens/PostLogin/SettingsDrawer/profile.dart';
import 'package:ntmu/Screens/PostLogin/SettingsDrawer/settings.dart';
import 'package:ntmu/Screens/PostLogin/SettingsDrawer/preferences.dart';
import 'package:ntmu/Screens/PostLogin/SettingsDrawer/feedback.dart';
import 'package:ntmu/Screens/PostLogin/SettingsDrawer/editProfile.dart';

class dataPacket{
  late String email;
  late String name;
  late DateTime birthday;
  late List<String> hobbies;
  late String password;
  late String profile_desc;
  late String course;
  late int year;
}

MaterialColor CreateMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red,
      g = color.green,
      b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

void authenticateUser(){
  //authenticateUser code here

}

void createAccount(BuildContext context){
  //create account code here
  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => create_account_email()));
}

void askName(BuildContext context){
  //retrieve name

}

void askBirthday(BuildContext context){
  //retrieve birthday


}

void askCourseYear(BuildContext context){
  //retrieve year and course of study
  //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_study())));
}

void uploadProfileDescription(BuildContext context){
  //upload profile picture and add description
  //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_profileDesc())));
}

void addHobbies(BuildContext context){
  //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_hobbies())));
}

void accountCreationConfirmation(BuildContext context){
  //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(create_account_confirmation())));
}

void forgotPassword(){
  //forget password options
}

void uploadPhoto(){
  //upload photo from device
}

void RegisterNewAccountInformation(BuildContext context){
  //send information to database, validate information and register user. Login into the main page(match with users).

  userRecommendationPage(context);
  //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(())));
}

void userRecommendationPage(BuildContext context){
  Navigator.of(context).pushNamedAndRemoveUntil('/userRecommendationPage', (Route<dynamic> route) => false);
}

void drawerProfile(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(profilePage())));
}

void settingsProfile(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(settingsPage())));
}

void preferencesProfile(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(preferencePage())));
}

void feedbackProfile(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(feedbackPage())));
}

void editProfile(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(editProfilePage())));
}

void editPreferences(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (editPreferencePage())));
}

void saveProfileEdits(){
  //Edit information in the database, update information viewer sees.
}

void checkPassword(String password){
  //if
}

bool confirmEditPassword(){
  //Check current password, check if new and re-entered password is the same, then edit the password in database, then show success popup
  //else show failure popup and remove bring user back to settings page
  return true;
}