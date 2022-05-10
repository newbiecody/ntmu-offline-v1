import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ntmu/api_functions/callLogin.dart';

import '../Components/functs.dart';
import '../Models/MatchedUser.dart';
import '../Models/UserInfo_secure.dart';
import '../common/GLOBAL_SETTINGS.dart';

import 'package:http/http.dart' as http;
import '../Components/MatchedUsersList_static.dart';
import 'apiMessageDialog.dart';

checkMatchingStatus() async{
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/check-matching-status/");
  var token = await checkForToken();
  var headers = {
    'Authorization': 'Token $token'
  };
  if(token != null){
    await http.get(url, headers: headers).then((value){
      final data = json.decode(value.body);
      var match_status = int.parse(data['match_status']);
      MatchedUsersData.user_matchingStatus = match_status;
      print(match_status);
      if(match_status == 1){
        print('fetching matches now....');
        getMatchedUsers();
      }
    });
  }
}


getMatchedUsers() async{
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/show-all-matching/");
  var token = await checkForToken();
  var headers = {
    'Authorization': 'Token $token'
  };

  if(token != null){
    await http.get(url, headers: headers).then((value) {
      final data = json.decode(value.body);
      if(!data.isEmpty){
        data.forEach((matchedUser_index, matchedUser) => {
          MatchedUsersData.list_matchedUsers.add(MatchedUser.fromJSON(matchedUser))
        });
      }
    });
  }
}


demandMatches(BuildContext context) async{
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/request-matches/");
  var token = await checkForToken();
  var headers = {
    'Authorization': 'Token $token'
  };
  var data = {
    "placeholder" : "placeholder"
  };

  if(token != null){
    await http.post(url, headers: headers, body: data).then((value) {
      final data = json.decode(value.body);
      var msg = data['msg'];
      showApiMessageDialog(context, 'Hi there...', msg);
    });
  }
}

startChat_withNewMatch() async {
  // Start chat if just matched
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/start-chat-new-match/");
  var token = await checkForToken();

  var headers = {
    'Authorization': 'Token $token'
  };

  if(token != null){
    await http.post(url, headers: headers).then((value) {
      // Do nothing
    });
  }
}

acceptRejectMatches(BuildContext context, choice_int, UserInfoFlexi_noPassword userdata) async{
  // If choice_int == 1 : Accept
  // If choice_int == -1 : Decline
  // Same as Django server.
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/accept-reject-match/");
  var token = await checkForToken();

  var headers = {
    'Authorization': 'Token $token'
  };
  var data = {
    "match_id" : MatchedUsersData.list_matchedUsers[0].matchID.toString(),
    "choice" : choice_int.toString()
  };

  if(token != null){
    await http.post(url, headers: headers, body: data).then((value) async {
      final data = json.decode(value.body);
      var msg = data['message'];
      if(msg == "Success"){
        print("Great!");
        MatchedUsersData.list_matchedUsers.removeAt(0);
        await startChat_withNewMatch();
        generateMainPage(userdata);
      }else if(msg == "Error"){
        showApiMessageDialog(context, "Error", "There is a problem with this option now... Please try again later.");
      }
    });
  }
}

// Automatically start chat thread if matched