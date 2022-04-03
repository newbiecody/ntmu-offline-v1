import 'dart:convert';

import 'package:ntmu/Components/chats_static_data.dart';
import 'package:ntmu/Models/ChatMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'callLogin.dart';

Future retrieveChats() async{
  final url = Uri.parse("http://10.0.2.2:8000/api_ntmuMobile/all-chats/");
  var token = await checkForToken();

  if(token != null){
    var headers = {
      'Authorization': 'Token $token'
    };
    await http.get(url, headers: headers).then((value) => {
      ChatData_static.user_id = json.decode(value.body)['user_id'],
      ChatData_static.message_threads = json.decode(value.body)['message_threads'],// Sorted from latest to earliest message
    }
    );
  }
}

Future sendMessage(int thread_id) async{
  final url = Uri.parse("http://10.0.2.2:8000/api_ntmuMobile/send-message/");

}


List <ChatMessage> generateList_chatMessage(List messages){
  List <ChatMessage> chatmessages = [];
  messages.forEach((message) => {
    chatmessages.add(ChatMessage(sender_id: message['sender_id'].toString(), content: message['content'], dateSent: DateTime.parse(message['sent_at'].replaceFirst('T', ' '))))
  });

  print(chatmessages);
  return chatmessages;
}