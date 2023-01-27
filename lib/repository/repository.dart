import 'dart:convert';

import 'package:remind_pills/model/user.dart';
import 'package:remind_pills/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository{

  final Request _request = Request();

  Future saveToken(String token) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('jwt', token);
  }

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final json = preferences.getString('jwt');
    if(json == null){
      return null;
    }
    return json;
  }

  Future saveUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("user", jsonEncode(user.toJson()));
  }

  Future<User?> getLocalUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final json = preferences.getString('user');
    if(json == null){
      return null;
    }
    return User.fromJson(jsonDecode(json));
  }

  Future<User> login(String email, String password) async{
    final res = await _request.login(email, password);
    saveToken(res["jwt"]);
    return res["user"];
  } 

  Future<User> register(User user) async{
    final res = await _request.register(user);
    saveToken(res["jwt"]);
    return res["user"];
  } 

  Future<User> getInfoUser() async => _request.getInfoUser(await getToken());

}