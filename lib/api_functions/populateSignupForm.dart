import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ntmu/Models/MatchModel.dart';
import 'package:ntmu/api_functions/apiMessageDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/functs.dart';
import '../Models/UserModel.dart';


// Future <UserModel?> populateSignupFormPagesAPI(BuildContext context) async {
Future populateSignupFormPagesAPI() async {
  final url = Uri.parse("http://10.0.2.2:8000/api_ntmuMobile/info-api/");

  final response = await http.get(url);

  if(response.statusCode == 200){
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

    var tempMapHobby = {};
    json.decode(jsonResponse['hobbyList']).forEach((hobby) =>{
      tempMapHobby[hobby['fields']['name']] = hobby['pk']
    });
    PopulateSignupFormData.list_allHobbies = tempMapHobby.keys.toList();
    PopulateSignupFormData.map_HobbiesWithID = tempMapHobby;


    List <String> tempListReligion = [];
    json.decode(jsonResponse['religionList']).forEach((hobby) =>{
      tempListReligion.add(hobby['fields']['name'])
    });
    // PopulateSignupFormData.map_ReligionsWithID = tempMapReligion;
    PopulateSignupFormData.list_allMajorReligions = tempListReligion;

    List <String> tempListCountry = [];
    json.decode(jsonResponse['countryList']).forEach((hobby) =>{
      tempListCountry.add(hobby['fields']['name'])
    });
    PopulateSignupFormData.list_allCountries = tempListCountry;

    var tempMapCourse = {};
    json.decode(jsonResponse['courseList']).forEach((course) =>{
      tempMapHobby[course['fields']['name']] = course['pk']
    });
    PopulateSignupFormData.list_allCourses = tempMapCourse.keys.toList();
    PopulateSignupFormData.map_CoursesWithID = tempMapCourse;


  }else{
    return null;
    // showApiErrorDialog(context, "Login error", "There seems to be an error logging you in, please try again.");
  }

}
