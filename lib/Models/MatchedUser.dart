class MatchedUser{
  late int matchID;
  late int id_userOne;
  late int id_userTwo;
  late String timestamp_string;
  late Map data_userTwo;

  MatchedUser({required this.matchID, required this.id_userOne, required this.timestamp_string, required this.data_userTwo, required this.id_userTwo});

  MatchedUser.fromJSON(Map<String, dynamic> json):
    matchID = json['matchID'],
    id_userOne = json['user1'],
    id_userTwo = json['user2'],
    timestamp_string = json['timestamp'],
    data_userTwo = json['user2_data'];

  Map<dynamic, dynamic> toJson() =>{
    'matchID' : matchID,
    'user1' : id_userOne,
    'user2' : id_userTwo,
    'timestamp' : timestamp_string,
    'user2_data' : data_userTwo
  };
}