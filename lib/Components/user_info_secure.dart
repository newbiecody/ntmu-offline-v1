import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  //email info
  static const _keyEmail = 'email';
  static Future SetEmail(String email) async =>{
    await _storage.write(key: _keyEmail, value:email)
  };
  static Future getEmail() async =>{
    await _storage.read(key: _keyEmail)
  };


}