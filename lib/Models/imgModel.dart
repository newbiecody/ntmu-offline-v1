class imgData{
  final int id;
  final String data;

  imgData({required this.id, required this.data});

  Map <String, dynamic> toMap(){
    return{
      'id': id,
      'data': data
    };
  }
}

