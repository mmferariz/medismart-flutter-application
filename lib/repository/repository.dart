import 'dart:convert';

import 'package:remind_pills/model/cita.dart';
import 'package:remind_pills/model/user.dart';
import 'package:remind_pills/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository{

  final Request _request = Request();

  Future clearLocalData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

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
    final User user = res["user"];
    user.password = password;
    saveUser(user);
    return user;
  } 

  Future<User> register(User user) async{
    final res = await _request.register(user);
    saveToken(res["jwt"]);
    final newUser = res["user"];
    newUser.password = user.password;
    saveUser(newUser);
    return newUser;
  } 

  Future<User> getInfoUser() async => _request.getInfoUser(await getToken());
  
  Future<Cita> registerAppointment(String reason, String? description) async => _request.registerAppointment(await getToken(), (await getLocalUser())?.id, reason, description);

}