import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:remind_pills/model/user.dart';
import 'package:remind_pills/repository/repository.dart';
import 'package:remind_pills/utils/custom_error_handler.dart';
import 'package:rxdart/rxdart.dart';

class SingletonBloc extends Bloc{

  final Repository _repository = Repository();
  
  StreamController<User> _scUser = BehaviorSubject();
  Stream<User> get streamUser => _scUser.stream;
  StreamSink<User> get sinkUser => _scUser.sink; 

  Future<User> login(String email, String password) async{
    try {
      return await _repository.login(email, password);
    } catch (e) {
      throw customErrorHandler(e);
    }
  }
  
  @override
  void dispose() {
    _scUser.close();
  }

}