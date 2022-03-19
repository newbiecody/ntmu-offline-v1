import 'package:ntmu/Models/imgModel.dart';
import 'package:sqflite/sqflite.dart';

Future <void> insertImgData(imgData img, Database database) async{
  final Database db = await database;
  await database.insert('ntmu_img', img.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
}
Future getImgData(Database database) async {
  final Database db = await database;
  final List <Map> imgs = await db.query('ntmu_img');
  return imgs;
}