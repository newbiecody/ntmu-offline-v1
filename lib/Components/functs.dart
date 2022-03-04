import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ntmu/Models/UserInfo.dart';

import 'package:ntmu/Screens/PostLogin/SettingsDrawer/editPreferences.dart';
import 'package:ntmu/Screens/PostLogin/SettingsDrawer/preferences.dart';
import 'package:ntmu/Screens/PostLogin/SettingsDrawer/feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

void authenticateUser(String username, String password, int flag){
  //authenticateUser code here
  //if flag == 0: After account creation
  //if flag == 1: Sign in with existing account

}

void clearSharedPreferences(){

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



// void drawerProfile(BuildContext context){
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(profilePage())));
// }

// void settingsProfile(BuildContext context){
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(settingsPage())));
// }

void preferencesProfile(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(preferencePage())));
}

void feedbackProfile(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(feedbackPage())));
}

// void editProfile(BuildContext context){
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>(editProfilePage())));
// }

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

String hobbiesString(List<String> hobbiesList){
  String hobbies = '';
  hobbiesList.forEach((element) {
    hobbies += element;
    hobbies += ', ';
  });
  hobbies = hobbies.substring(0, hobbies.length-2);

  return hobbies;
}

String timeFromNow(DateTime time) {
  var differenceFromNow_year = DateTime
      .now()
      .year - time.year;
  var differenceFromNow_month = DateTime
      .now()
      .month - time.month;
  var differenceFromNow_day = DateTime
      .now()
      .day - time.day;
  var differenceFromNow_hour = DateTime
      .now()
      .hour - time.hour;
  var differenceFromNow_min = DateTime
      .now()
      .minute - time.minute;
  var differenceFromNow_secs = DateTime
      .now()
      .second - time.second;

  if (differenceFromNow_year > 0) {
    if (differenceFromNow_year == 1){
      return differenceFromNow_year.toString() + ' year ago';
    } else {
      return differenceFromNow_year.toString() + ' years ago';
    }
  } else {
    if (differenceFromNow_month > 0) {
      if (differenceFromNow_month == 1){
        return differenceFromNow_month.toString() + ' month ago';
      } else {
        return differenceFromNow_month.toString() + ' months ago';
      }
    } else {
      if (differenceFromNow_day > 0) {
        if (differenceFromNow_day == 1){
          return differenceFromNow_day.toString() + ' day ago';
        } else {
          return differenceFromNow_day.toString() + ' days ago';
        }
      } else {
        if (differenceFromNow_hour > 0) {
          if (differenceFromNow_hour == 1){
            return differenceFromNow_hour.toString() + ' hour ago';
          } else {
            return differenceFromNow_hour.toString() + ' hours ago';
          }
        } else {
          if (differenceFromNow_min > 0) {
            if (differenceFromNow_min == 1){
              return differenceFromNow_min.toString() + ' minute ago';
            } else {
              return differenceFromNow_min.toString() + ' minutes ago';
            }
          } else {
            if (differenceFromNow_secs > 10) {
              return differenceFromNow_secs.toString() + ' seconds ago';
            } else {
              return 'Just now';
            }
          }
        }
      }
    }
  }
}

Future<List<String>> readByLine_txt(String path) async {
  String rawTxt = await rootBundle.loadString('path');
  List<String> list_readItemsByLine = rawTxt.split('\n');
  return list_readItemsByLine;
}



generateTags(List list_of_tags){
  List <Widget> list_of_tags_widget = [];//[SizedBox(width: 16)];
  if(list_of_tags.length>0) {
    list_of_tags.forEach((element) {
      list_of_tags_widget.add(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
                color: Color(0XFF99DDC8),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(element,
              style: TextStyle(
                fontSize: 12
              ),
            ),
          )
      );
    });
  }
  return list_of_tags_widget;

}

retrieveComments(String postID){
  //fake comment generation

}


final list_allCourses = [
  'Accountancy',
  'Accountancy (GA)',
  'Accountancy (GB)',
  'Accountancy And Business',
  'Aerospace Engineering',
  'Aerospace Engineering And Economics',
  'Art, Design & Media',
  'Art, Design & Media (ADM)',
  'Art, Design & Media (ANIM)',
  'Art, Design & Media (DA)',
  'Art, Design & Media (DIPH)',
  'Art, Design & Media (FILM)',
  'Art, Design & Media (INME)',
  'Art, Design & Media (MA)',
  'Art, Design & Media (PROD)',
  'Art, Design & Media (VISC)',
  'Bioengineering',
  'Bioengineering And Economics',
  'Biological Sciences',
  'Biological Sciences And Psychology',
  'Biomedical Sciences',
  'Biomedical Sciences And Biobusiness',
  'Business',
  'Business And Computer Engineering',
  'Business And Computing',
  'Chemical & Biomolecular Engineering',
  'Chemical & Biomolecular Engineering And Economics',
  'Chemistry and Biological Chemistry',
  'Chinese',
  'Civil Engineering',
  'Civil Engineering And Economics',
  'Communication Studies',
  'Computer Engineering',
  'Computer Engineering And Economics',
  'Computer Science',
  'Computer Science And Economics',
  'Data Science And Artificial Intelligence',
  'Economics',
  'Economics And Media Analytics',
  'Economics And Psychology',
  'Economics And Public Policy & Global Affairs',
  'Electrical & Electronic Engineering',
  'Electrical & Electronic Engineering And Economics',
  'Engineering',
  'Engineering (CEE)',
  'Engineering (EEE)',
  'Engineering (ENE)',
  'Engineering (ME)',
  'English',
  'English Literature And Art History',
  'Environmental Earth Systems Science',
  'Environmental Earth Systems Science And Public Policy & Global Affairs',
  'Environmental Engineering',
  'Environmental Engineering And Economics',
  'History',
  'Humanities',
  'Information Engineering & Media',
  'Information Engineering & Media And Economics',
  'Linguistics & Multilingual Studies',
  'Maritime Studies',
  'Maritime Studies (ITG)',
  'Maritime Studies (MSB)',
  'Materials Engineering',
  'Materials Engineering And Economics',
  'Mathematical And Computer Sciences',
  'Mathematical Sciences',
  'Mathematical Sciences And Economics',
  'Mathematics & Economics',
  'Mechanical Engineering',
  'Mechanical Engineering And Economics',
  'Philosophy',
  'Physical and Mathematical Sciences',
  'Physics and Applied Physics',
  'Psychology',
  'Psychology And Linguistics & Multilingual Studies',
  'Psychology And Media Analytics',
  'Public Policy And Global Affairs',
  'Renaissance Engineering',
  'Social Sciences',
  'Sociology',
  'Sport Science & Management',
];

convertAssetImageBase64() async {

}

class PopulateSignupFormData{
  static var list_allCourses;
  static var list_allCountries;
  static var list_allMajorReligions;
  static var list_allHobbies;

  static var map_ReligionsWithID;
  static var map_CountriesWithID;
  static var map_HobbiesWithID;
  static var map_CoursesWithID;

  static var numOfHobbies = list_allHobbies.length;
  static var numOfReligions = list_allMajorReligions.length;
}


createPath(String dir) async{
  final path = Directory(dir);
  if((await path.exists())){
    print("Directory exists..");
  }else{
    print("Directory does not exist");
    try{
      path.create(recursive: true);
    }catch(_){}

  }
}