import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:remind_pills/repository/repository.dart';
import 'package:remind_pills/utils/custom_error_handler.dart';
import 'package:rxdart/rxdart.dart';

class IccBloc extends Bloc{

  final Repository _repository = Repository();
  
  // StreamController<Icc> _scIccs = BehaviorSubject();
  // Stream<Icc> get streamIccs => _scIccs.stream;
  // StreamSink<Icc> get sinkUser => _scIccs.sink; 

  Future<String?> checkOut() async{
    try {
      // return await _repository.checkOut(icc);
    } catch (e) {
      customErrorHandler(e);
    }
  }
  
  @override
  void dispose() {
  }

}