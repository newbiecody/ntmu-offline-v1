import 'package:ntmu/Models/imgModel.dart';
import 'package:sqflite/sqflite.dart';

Future <void> insertImgData(imgData img, Database database) async{
  final Database db = await database;
  await database.insert('ntmu_img', img.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
}