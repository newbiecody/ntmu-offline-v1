import 'package:ntmu/Components/announcements_static.dart';
import '../Models/AnnouncementHeaderInfo.dart';

import 'dart:convert';
import '../common/GLOBAL_SETTINGS.dart';
import 'callLogin.dart';
import 'package:http/http.dart' as http;

Future getAdminAnnouncements() async{
  final url = Uri.parse("${address_targetMachine_uri}api_ntmuMobile/announcements/");

  var token = await checkForToken();
  List <AnnouncementHeaderInfo> allAnnouncements = [];
  if(token != null){
    await http.get(url).then((value) {
      final data = json.decode(value.body);
      data.forEach((announcement_id, announcement_body){
        var timestamp = null;
        if(announcement_body['timestamp'] != null){
          timestamp = DateTime.parse(announcement_body['timestamp'].replaceFirst('T', ' '));
        };
        allAnnouncements.add(AnnouncementHeaderInfo(time: timestamp, poster: 'Admin', messageText: announcement_body['description']));
      });
    }
    );
    Announcements_static.announcements_list = allAnnouncements;
  }
}
